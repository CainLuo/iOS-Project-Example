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

#import <objc/Object.h>

@interface RunTimeController ()

@end

@implementation RunTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    RunTimeModel *model = [[RunTimeModel alloc] init];
//    
//    NSLog(@"%@", model);
    
    [self test];
}

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

@end
