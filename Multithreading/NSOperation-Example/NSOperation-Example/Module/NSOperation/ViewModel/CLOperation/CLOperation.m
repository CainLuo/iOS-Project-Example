//
//  CLOperation.m
//  NSOperation-Example
//
//  Created by Cain on 2017/8/6.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "CLOperation.h"

@implementation CLOperation

- (void)main {
    
    for (NSInteger i = 0; i < 5; i++) {
        
        NSLog(@"执行了第%zd次任务, 当前线程为: %@", i, [NSThread currentThread]);
    }
}

@end
