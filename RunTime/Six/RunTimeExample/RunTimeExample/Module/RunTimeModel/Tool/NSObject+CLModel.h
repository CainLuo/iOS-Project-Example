//
//  NSObject+CLModel.h
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/5.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional

// 提供一些用来转换模型的协议, 只要遵守了这个协议, 就可以把数组中的字典转成模型
+ (NSDictionary *)cl_arrayToModelClass;

@end

@interface NSObject (CLModel)

+ (instancetype)cl_modelToDictionary:(NSDictionary *)dictionary;

+ (instancetype)cl_modelToDictionary2:(NSDictionary *)dictionary;

+ (instancetype)cl_modelToDictionary3:(NSDictionary *)dictionary;

@end
