//
//  RunTimeInterceptController.m
//  RunTimeExample
//
//  Created by Cain on 2017/10/1.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeInterceptController.h"
#import "InterceptModel.h"
#import "BaseModel.h"

#import <objc/message.h>

@interface RunTimeInterceptController ()

@end

@implementation RunTimeInterceptController

+ (void)initialize {

    // 拦截实例方法
    Method mehtodOne = class_getInstanceMethod([BaseModel class], @selector(cl_logBaseModel));
    Method mehtodTwo = class_getInstanceMethod([InterceptModel class], @selector(cl_logInterceptModel));
    
    method_exchangeImplementations(mehtodOne, mehtodTwo);
    
    // 拦截类方法
    Method classMehtodOne = class_getClassMethod([BaseModel class], @selector(cl_logBaseModelClass));
    Method classMehtodTwo = class_getClassMethod([InterceptModel class], @selector(cl_logInterceptModelClass));
    
    method_exchangeImplementations(classMehtodOne, classMehtodTwo);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);

    self.view.backgroundColor = [UIColor whiteColor];
    
    BaseModel *baseModel = [[BaseModel alloc] init];
    
    [baseModel cl_logBaseModel];
    
    [BaseModel cl_logBaseModelClass];
}

@end
