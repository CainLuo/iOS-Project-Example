//
//  RunTimeMethodModel.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/28.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeMethodModel.h"

@implementation RunTimeMethodModel

//+ (void)load {
//
//    Method methodOne = class_getInstanceMethod(self, @selector(cl_height));
//    Method methodTwo = class_getInstanceMethod(self, @selector(cl_weight));
//
//    method_exchangeImplementations(methodOne, methodTwo);
//    
//    NSLog(@"load: 执行了交换方法");
//}

+ (void)initialize {
    
    Method methodOne = class_getInstanceMethod(self, @selector(cl_height));
    Method methodTwo = class_getInstanceMethod(self, @selector(cl_weight));
    
    method_exchangeImplementations(methodOne, methodTwo);
    
    NSLog(@"initialize: 执行了交换方法");
}

- (NSString *)cl_height {
    
    return @"我身高180";
}

- (NSString *)cl_weight {
    
    return @"我体重280";
}

@end
