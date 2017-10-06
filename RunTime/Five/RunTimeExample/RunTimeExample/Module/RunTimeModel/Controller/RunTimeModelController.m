//
//  RunTimeModelController.m
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/5.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeModelController.h"
#import "RunTimeBaseModel.h"

#import "RunTimeBaseModel.h"
#import "NSObject+CLModel.h"

@interface RunTimeModelController ()

@end

@implementation RunTimeModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);

    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self cl_modelToDictionary];
//    [self cl_modelToDictionary2];
    [self cl_modelToDictionary3];
}

- (void)cl_modelToDictionary {
    
    NSDictionary *dictionary = @{@"cl_age":@"20",
                                 @"cl_name":@"小明"};
    
    RunTimeBaseModel *baseModel = [RunTimeBaseModel cl_modelToDictionary:dictionary];
    
    NSLog(@"%@", baseModel);
}

- (void)cl_modelToDictionary2 {
    
    NSDictionary *dictionary = @{@"cl_age":@"20",
                                 @"cl_name":@"小明",
                                 @"info":@{@"cl_work":@"iOS开发工程师"}};
    
    RunTimeBaseModel *baseModel = [RunTimeBaseModel cl_modelToDictionary2:dictionary];
    
    NSLog(@"%@", baseModel.info.cl_work);
}

- (void)cl_modelToDictionary3 {
    
    NSDictionary *dictionary = @{@"cl_age":@"20",
                                 @"cl_name":@"小明",
                                 @"data":@[@{@"cl_device":@"苹果手机"}]};
    
    RunTimeBaseModel *baseModel = [RunTimeBaseModel cl_modelToDictionary3:dictionary];
    
    NSLog(@"%@", baseModel.data);
}

@end
