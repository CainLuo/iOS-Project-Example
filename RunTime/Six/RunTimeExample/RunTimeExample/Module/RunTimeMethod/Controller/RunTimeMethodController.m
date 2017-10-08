//
//  RunTimeMethodController.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeMethodController.h"
#import "RunTimeMethodModel.h"

#import <objc/message.h>

@implementation RunTimeMethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    RunTimeMethodModel *methodModel = [[RunTimeMethodModel alloc] init];
    
    NSLog(@"身高: %@", methodModel.cl_height);
    NSLog(@"体重: %@", methodModel.cl_weight);

//    Method methodOne = class_getInstanceMethod([methodModel class], @selector(cl_height));
//    Method methodTwo = class_getInstanceMethod([methodModel class], @selector(cl_weight));
//
//    method_exchangeImplementations(methodOne, methodTwo);
//
//    NSLog(@"打印的内容: %@", [methodModel cl_height]);
}

@end
