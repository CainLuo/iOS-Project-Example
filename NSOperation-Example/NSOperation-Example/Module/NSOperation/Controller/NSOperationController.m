//
//  NSOperationController.m
//  NSOperation-Example
//
//  Created by Cain on 2017/8/6.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSOperationController.h"
#import "CLOperation.h"

@interface NSOperationController ()

@end

@implementation NSOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self invocationOperation];
//    [self blockOperation];
    [self customOperation];
}

#pragma mark - NSInvocationOperation
- (void)invocationOperation {
    
    NSInvocationOperation *invocationPeration = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                     selector:@selector(runTheOperation)
                                                                                       object:nil];
    
    [invocationPeration start];
}

- (void)runTheOperation {
    
    NSLog(@"执行任务, 当前的线程为: %@", [NSThread currentThread]);
}

#pragma mark - NSBlockOperation
- (void)blockOperation {
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"执行任务, 当前的线程为: %@", [NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        
        NSLog(@"执行第二个任务, 当前的线程为: %@", [NSThread currentThread]);
    }];

    [blockOperation addExecutionBlock:^{
        
        NSLog(@"执行第三个任务, 当前的线程为: %@", [NSThread currentThread]);
    }];

    [blockOperation addExecutionBlock:^{
        
        NSLog(@"执行第四个任务, 当前的线程为: %@", [NSThread currentThread]);
    }];

    [blockOperation start];
}

#pragma mark - CustomOperation
- (void)customOperation {
    
    CLOperation *clOperation = [[CLOperation alloc] init];
    
    [clOperation start];
}

@end
