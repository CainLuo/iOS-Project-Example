//
//  GCDController.m
//  GCD-Example
//
//  Created by Cain on 2017/8/5.
//
//

#import "GCDController.h"

@interface GCDController ()

@end

@implementation GCDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self syncQueueConcurrent];
//    [self asyncQueueConcurrent];
//    [self syncQueueSerial];
//    [self asyncQueueSerial];
    
//    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_async(queue, ^{
//        
//        [self syncMainQueue];
//    });
    
    [self asyncMainQueue];
}

#pragma mark - 并行队列+同步执行
- (void)syncQueueConcurrent {
    
    NSLog(@"开始执行任务");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });

    dispatch_sync(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

#pragma mark - 并行队列+异步执行
- (void)asyncQueueConcurrent {
    
    NSLog(@"开始执行任务");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

#pragma mark - 串行队列+同步执行
- (void)syncQueueSerial {
    
    NSLog(@"开始执行任务");

    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

#pragma mark - 串行队列+异步执行
- (void)asyncQueueSerial {
    
    NSLog(@"开始执行任务");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

#pragma mark - 主队列+同步执行
- (void)syncMainQueue {
    
    NSLog(@"开始执行任务");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

#pragma mark - 主队列+异步执行
- (void)asyncMainQueue {
    
    NSLog(@"开始执行任务");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    NSLog(@"结束执行任务");
}

@end
