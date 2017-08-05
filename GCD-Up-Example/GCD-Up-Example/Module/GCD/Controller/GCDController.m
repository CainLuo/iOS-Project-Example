//
//  GCDController.m
//  GCD-Up-Example
//
//  Created by Cain on 2017/8/5.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "GCDController.h"

@interface GCDController ()

@end

@implementation GCDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self gcdCommunication];
//    [self gcdBarrier];
//    [self gcdAfter];
//    [self gcdOne];
    [self gcdApply];
}

#pragma mark - GCD的通信
- (void)gcdCommunication {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSInteger i = 0; i < 5; i++) {
            
            NSLog(@"第%ld次任务的主线程为: %@", i, [NSThread currentThread]);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"回到主线程, 该线程为: %@", [NSThread currentThread]);
        });
    });
}

#pragma mark - GCD的栅栏方法
- (void)gcdBarrier {
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        NSLog(@"第一次任务的主线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第二次任务的主线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        
        NSLog(@"第一次任务, 第二次任务执行完毕, 继续执行");
    });

    dispatch_async(queue, ^{
        
        NSLog(@"第三次任务的主线程为: %@", [NSThread currentThread]);
    });

    dispatch_async(queue, ^{
        
        NSLog(@"第四次任务的主线程为: %@", [NSThread currentThread]);
    });
}

#pragma mark - GCD的延迟方法
- (void)gcdAfter {
    
    NSLog(@"我是一个路人");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"2秒后执行了.");
    });
}

#pragma mark - GCD执行单次的方法
- (void)gcdOne {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        // 这里写只执行一次的任务就好了, 默认是线程安全, 所以不用担心
    });
}

#pragma mark - GCD快速遍历方法
- (void)gcdApply {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(5, queue, ^(size_t index) {
        
        NSLog(@"执行第%ld任务, 当前线程为: %@", index, [NSThread currentThread]);
    });
}

#pragma mark - CGD的队列组
- (void)gcdQueueGroup {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group,
                         queue,
                         ^{
                             // 执行第一个耗时的任务
                         });
    
    dispatch_group_async(group,
                         queue,
                         ^{
                             // 执行第二个耗时的任务
                         });
    
    dispatch_group_notify(group,
                          dispatch_get_main_queue(),
                          ^{
                              // 回到主线程
                          });
}

@end
