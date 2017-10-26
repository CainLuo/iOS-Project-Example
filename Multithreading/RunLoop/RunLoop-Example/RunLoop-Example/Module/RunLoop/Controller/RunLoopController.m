//
//  RunLoopController.m
//  RunLoop-Example
//
//  Created by Cain on 2017/8/7.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunLoopController.h"
#import <mach/message.h>

@interface RunLoopController ()

@end

@implementation RunLoopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loop];
}

- (void)loop {
    
    BOOL run = YES;
    
    do {
        
        NSLog(@"执行任务");

        run = NO;

    } while (run);
}

@end
