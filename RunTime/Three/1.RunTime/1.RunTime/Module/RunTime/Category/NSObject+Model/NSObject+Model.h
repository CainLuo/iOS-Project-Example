//
//  NSObject+Model.h
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

/**
 字典转模型

 @param dictionary NSDictionary
 @return id
 */
+ (id)objectWithKeyValues:(NSDictionary *)dictionary;

/**
 模型转字典

 @return NSDictionary
 */
- (NSDictionary *)keyValuesWithObject;

@end
