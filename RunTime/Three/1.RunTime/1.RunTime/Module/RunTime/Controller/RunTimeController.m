//
//  RunTimeController.m
//  1.RunTime
//
//  Created by Cain on 2017/8/21.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeController.h"
#import "RunTimeModel.h"
#import "TestModel.h"
#import "TestModel+String.h"
#import "CoderModel.h"
#import "NSObject+Model.h"
#import "BicycleModel.h"

#import <objc/Object.h>

@interface RunTimeController ()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation RunTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self msgSend];
//    [self test];
    
//    self.dictionary = @{@"name":@"小明",
//                        @"age":@18,
//                        @"phoneNumber":@13800138000};
//    
//    [self coderModel];
    
    [self dynamicAnalysis];
}

- (void)msgSend {
    
    RunTimeModel *model = [[RunTimeModel alloc] init];

    NSLog(@"%@", model);
}

#pragma mark - 消息发送
- (void)test {
    
    TestModel *objct = [[TestModel alloc] init];
    
    ((void (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("country"));
    
    ((void (*) (id, SEL, NSString *)) objc_msgSend) (objct, sel_registerName("getProvince:"), @"广东省");
    
    ((void (*) (id, SEL, NSString *, NSString *)) objc_msgSend) (objct, sel_registerName("getCity:station:"), @"深圳市", @"世界之窗");
    
    NSString *weather = ((NSString* (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("getWeather"));
    
    NSLog(@"%@", weather);
    
    objct.testString = @"小明";
    
    NSLog(@"Category: %@", objct.testString);
}

#pragma mark - 归档 / 模型转换
- (void)coderModel {
    
    CoderModel *coderModel = [CoderModel objectWithKeyValues:self.dictionary];
    
    NSLog(@"%@, %ld, %ld", coderModel.name, coderModel.age, coderModel.phoneNumber);
    
    NSDictionary *dictionary = [coderModel keyValuesWithObject];
    
    NSLog(@"dictionary is %@", dictionary);
}

#pragma mark - 动态解析
- (void)dynamicAnalysis {
    
    BicycleModel *bicycle = [[BicycleModel alloc] init];
    
    ((void (*) (id, SEL)) objc_msgSend) (bicycle, sel_registerName("rapidAcceleration"));
}

@end
