//
//  NSObject+Model.m
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Model)

+ (id)objectWithKeyValues:(NSDictionary *)dictionary {
    
    id objc = [[self alloc] init];
    
    for (NSString *key in dictionary.allKeys) {
        
        id value = dictionary[key];
        
        // 判断当前属性是否属于Model
        objc_property_t property = class_getProperty(self, key.UTF8String);
        
        unsigned int outCount = 0;
        
        objc_property_attribute_t *attributeList = property_copyAttributeList(property, &outCount);
        
        objc_property_attribute_t attribute = attributeList[0];
        
        NSString *typeString = [NSString stringWithUTF8String:attribute.value];
        
        if ([typeString isEqualToString:@"@\"CoderModel\""]) {
            
            value = [self objectWithKeyValues:value];
        }
        
        // 生成setter方法，并用objc_msgSend调用
        NSString *methodName = [NSString stringWithFormat:@"set%@%@:", [key substringToIndex:1].uppercaseString, [key substringFromIndex:1]];
        
        SEL setter = sel_registerName(methodName.UTF8String);
        
        if ([objc respondsToSelector:setter]) {
            
            ((void (*) (id,SEL,id)) objc_msgSend) (objc,setter,value);
        }
        
        free(attributeList);
    }
    
    return objc;
}

- (NSDictionary *)keyValuesWithObject {
    
    unsigned int outCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < outCount; i ++) {
        
        objc_property_t property = propertyList[i];
        
        //生成getter方法，并用objc_msgSend调用
        const char *propertyName = property_getName(property);
        
        SEL getter = sel_registerName(propertyName);
        
        if ([self respondsToSelector:getter]) {
            
            id value = ((id (*) (id,SEL)) objc_msgSend) (self,getter);
            
            // 判断当前属性是否属于Model
            if ([value isKindOfClass:[self class]] && value) {
                
                value = [value keyValuesWithObject];
            }
            
            if (value) {
                
                NSString *key = [NSString stringWithUTF8String:propertyName];
                
                [mutableDictionary setObject:value
                                      forKey:key];
            }
        }
    }
    
    free(propertyList);
    
    return mutableDictionary;
}

@end
