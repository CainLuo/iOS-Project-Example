//
//  GCDTipsController.m
//  GCD-Tips
//
//  Created by Cain on 2017/9/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "GCDTipsController.h"

@interface GCDTipsController ()

@end

@implementation GCDTipsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"开始执行");
    
//    [self mineQueueLockThread];
//    [self applyLockThread];
//    [self groupQueueAfter];
//    [self groupQueueAfterNested];
    [self queueApply];
}

- (void)mineQueueLockThread {
    
    dispatch_queue_t queue = dispatch_queue_create("mineQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        
        NSLog(@"第一次执行, %@", [NSThread currentThread]);
        
        dispatch_async(queue, ^{
            
            NSLog(@"第二次执行, %@", [NSThread currentThread]);
        });
    });
}

- (void)applyLockThread {
    
    dispatch_queue_t queue = dispatch_queue_create("applyQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_apply(3, queue, ^(size_t i) {
        
        NSLog(@"延迟添加一");
        
        dispatch_apply(3, queue, ^(size_t j) {
            
            NSLog(@"延迟添加二");
        });
    });
}

- (void)groupQueueAfter {
    
    dispatch_time_t timeOne = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_time_t timeTwo = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();

    dispatch_after(timeOne, mainQueue, ^{
        
        NSLog(@"延迟添加一");
    });
    
    dispatch_after(timeTwo, mainQueue, ^{

        NSLog(@"延迟添加二");
    });
}

- (void)groupQueueAfterNested {
    
    dispatch_time_t timeOne = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_time_t timeTwo = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_after(timeOne, mainQueue, ^{
        
        NSLog(@"延迟添加一");
        
        
        dispatch_after(timeTwo, mainQueue, ^{
            
            NSLog(@"延迟添加二");
        });
    });
}

- (void)queueApply {
    
    NSLog(@"开始执行, 当前线程为:%@", [NSThread currentThread]);
    
    dispatch_queue_t queueOne = dispatch_queue_create("applyQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueTwo = dispatch_queue_create("applyQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_apply(3, queueOne, ^(size_t i) {
        
        NSLog(@"延迟执行一: %zu, 当前线程为:%@", i, [NSThread currentThread]);
    });
    
    dispatch_apply(3, queueTwo, ^(size_t i) {
        
        NSLog(@"延迟执行二: %zu, 当前线程为:%@", i, [NSThread currentThread]);
    });
    
    NSLog(@"结束执行, 当前线程为:%@", [NSThread currentThread]);
}

@end
