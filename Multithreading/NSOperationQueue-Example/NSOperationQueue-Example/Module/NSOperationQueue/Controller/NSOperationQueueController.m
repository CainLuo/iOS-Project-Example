//
//  NSOperationQueueController.m
//  NSOperationQueue-Example
//
//  Created by Cain on 2017/8/6.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSOperationQueueController.h"

@interface NSOperationQueueController ()

@end

@implementation NSOperationQueueController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addMissionToOperationQueue];
//    [self addMissionToPerationQueueBlock];
//    [self changeSyncOrAsyncQueue];
    [self addDependency];
}

#pragma mark - 创建NSOperationQueue对象
- (void)operationQueue {
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    NSOperationQueue *otherQueue = [[NSOperationQueue alloc] init];
}

#pragma mark - 添加任务到NSOperationQueue(一)
- (void)addMissionToOperationQueue {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                      selector:@selector(runInvocationOperation)
                                                                                        object:nil];
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        for (NSInteger i = 0; i < 2; i++) {
            
            NSLog(@"blockOperation执行第%zd任务, 当前的线程为: %@", i, [NSThread currentThread]);
        }
    }];
    
    [queue addOperation:invocationOperation];
    [queue addOperation:blockOperation];
}

- (void)runInvocationOperation {
    
    for (NSInteger i = 0; i < 3; i++) {
        
        NSLog(@"invocationOperation执行第%zd任务, 当前的线程为: %@", i, [NSThread currentThread]);
    }
}

#pragma mark - 添加任务到NSOperationQueue(二)
- (void)addMissionToPerationQueueBlock {
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    [operationQueue addOperationWithBlock:^{
        
        for (NSInteger i = 0; i < 3; i++) {
            
            NSLog(@"执行第%zd任务, 当前的线程为: %@", i, [NSThread currentThread]);
        }
    }];
}

#pragma mark - 切换串行/并行队列
- (void)changeSyncOrAsyncQueue {
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    // 如果要串行队列, 就设置为1, 否则就不设置, 默认并行队列
    operationQueue.maxConcurrentOperationCount = 1;
    
    [operationQueue addOperationWithBlock:^{
        
        NSLog(@"执行第一个任务, 当前的线程为: %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [operationQueue addOperationWithBlock:^{
        
        NSLog(@"执行第二个任务, 当前的线程为: %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.1];
    }];

    [operationQueue addOperationWithBlock:^{
        
        NSLog(@"执行第三个任务, 当前的线程为: %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [operationQueue addOperationWithBlock:^{
        
        NSLog(@"执行第四个任务, 当前的线程为: %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.1];
    }];

    [operationQueue addOperationWithBlock:^{
        
        NSLog(@"执行第五个任务, 当前的线程为: %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.1];
    }];
}

- (void)addDependency {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
    NSBlockOperation *blockOperationOne = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"执行第一次任务, 当前线程为: %@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *blockOperationTwo = [NSBlockOperation blockOperationWithBlock:^{

        NSLog(@"执行第二次任务, 当前线程为: %@", [NSThread currentThread]);
    }];
    
    [blockOperationTwo addDependency:blockOperationOne];
    
    [queue addOperation:blockOperationOne];
    [queue addOperation:blockOperationTwo];
}

@end
