//
//  NSThreadController.m
//  NSThread-Example
//
//  Created by Cain on 2017/8/6.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSThreadController.h"

#import <pthread.h>

@interface NSThreadController ()

@end

@implementation NSThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self cratePthread];
//    [self nsthread];
    [self backgroundThread];
}

#pragma mark - Pthread
- (void)cratePthread {
    
    pthread_t thread;
    
    pthread_create(&thread, NULL, run, NULL);
}

void *run(void *param) {
    
    NSLog(@"执行任务, 当前的线程为: %@", [NSThread currentThread]);
    
    return NULL;
}

#pragma mark - NSThread的简单使用
- (void)nsthread {
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self
                                               selector:@selector(runTheThread)
                                                 object:nil];
    
    [thread start];
}

- (void)runTheThread {
    
    NSLog(@"执行任务, 当前的线程为: %@", [NSThread currentThread]);
}

#pragma mark - BackgroundThread
- (void)backgroundThread {
    
    [self performSelectorOnMainThread:@selector(runTheBackgroundThread)
                           withObject:nil
                        waitUntilDone:YES];
}

- (void)runTheBackgroundThread {
    
    NSLog(@"执行任务, 当前的线程为: %@", [NSThread currentThread]);
}

@end
