//
//  NSObject+CLModel.m
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/5.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSObject+CLModel.h"

@implementation NSObject (CLModel)

+ (instancetype)cl_modelToDictionary:(NSDictionary *)dictionary {
    
    id object = [[self alloc] init];
    
    unsigned int count = 0;
    
    // 获取成员变量列表
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 根据角标取出对应的成员变量
        Ivar ivar = ivarList[i];
        
        // 获取对应的属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 从下标1开始取对应的key, 不然的话, 就会取到带"_"的key
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据属性名在字典中查找对应的value
        id value = dictionary[key];
        
        // 判断value是否为nil, 如果不是, 就给属性赋值
        // 当属性的数量大于字典Key的数量时的判断
        if (value) {
            
            [object setValue:value
                      forKey:key];
        }
    }
    
    return object;
}

+ (instancetype)cl_modelToDictionary2:(NSDictionary *)dictionary {
    
    id object = [[self alloc] init];
    
    unsigned int count = 0;
    
    // 获取成员变量列表
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 根据角标取出对应的成员变量
        Ivar ivar = ivarList[i];
        
        // 获取对应的属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 获取成员变量的类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];

        // 从下标1开始取对应的key, 不然的话, 就会取到带"_"的key
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据属性名在字典中查找对应的value
        id value = dictionary[key];
        
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            
            // 替换成员变量的类型
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];

            Class modelClass = NSClassFromString(ivarType);
            
            // 有对应的模型才需要转
            if (modelClass) {
                
                // 把字典转模型
                value = [modelClass cl_modelToDictionary2:value];
            }
        }
        
        // 判断value是否为nil, 如果不是, 就给属性赋值
        // 当属性的数量大于字典Key的数量时的判断
        if (value) {
            
            [object setValue:value
                      forKey:key];
        }
    }
    
    return object;
}

+ (instancetype)cl_modelToDictionary3:(NSDictionary *)dictionary {

    id object = [[self alloc] init];
    
    unsigned int count = 0;
    
    // 获取成员变量列表
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 根据角标取出对应的成员变量
        Ivar ivar = ivarList[i];
        
        // 获取对应的属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 从下标1开始取对应的key, 不然的话, 就会取到带"_"的key
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据属性名在字典中查找对应的value
        id value = dictionary[key];
        
        // 判断是否是数组类型
        if ([value isKindOfClass:[NSArray class]]) {
            
            // 判断能否响应代理方法
            if ([self respondsToSelector:@selector(cl_arrayToModelClass)]) {
                
                // 转换一下self
                id allSelf = self;
                
                // 获取数组中字典对应的模型
                NSString *classType = [allSelf cl_arrayToModelClass][key];
                
                // 生成对应的模型
                Class classModel = NSClassFromString(classType);
                
                NSMutableArray *modelArray = [NSMutableArray array];
                
                // 遍历字典里的数组
                for (NSDictionary *dictionary in value) {
                    
                    // 字典转模型
                    id model = [classModel cl_modelToDictionary3:dictionary];
                    
                    [modelArray addObject:model];
                }
                
                value = modelArray;
            }
        }
        
        // 判断value是否为nil, 如果不是, 就给属性赋值
        // 当属性的数量大于字典Key的数量时的判断
        if (value) {
            
            [object setValue:value
                      forKey:key];
        }
    }
    
    return object;
}

@end
