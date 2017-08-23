//
//  TestModel.m
//  1.RunTime
//
//  Created by Cain on 2017/8/22.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        NSLog(@"%@", [self class]);
        NSLog(@"%@", [super class]);
    }
    
    return self;
}

- (void)country {
    NSLog(@"中国");
}

- (void)getProvince:(NSString *)provinceName {
    NSLog(@"%@", provinceName);
}

- (void)getCity:(NSString *)cityName
        station:(NSString *)stationName {
    
    NSLog(@"%@, %@", cityName, stationName);
}

- (NSString *)getWeather {
    
    return @"晴天";
}

@end
