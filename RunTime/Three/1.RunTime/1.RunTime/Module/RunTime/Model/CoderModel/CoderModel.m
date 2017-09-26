//
//  CoderModel.m
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "CoderModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation CoderModel

- (void)encodeWithCoder:(NSCoder *)coder{
    
    unsigned int outCount = 0;
    
    Ivar *vars = class_copyIvarList([self class], &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        
        Ivar var = vars[i];
        
        const char *name = ivar_getName(var);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [coder encodeObject:value
                     forKey:key];
    }
    
    free(vars);
}

- (nullable instancetype)initWithCoder:(NSCoder *)decoder{
    
    if (self = [super init]) {
        
        unsigned int outCount = 0;
        
        Ivar *vars = class_copyIvarList([self class], &outCount);
        
        for (int i = 0; i < outCount; i ++) {
            
            Ivar var = vars[i];
            
            const char *name = ivar_getName(var);
            
            NSString *key = [NSString stringWithUTF8String:name];
            
            id value = [decoder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];
        }
        
        free(vars);
    }
    
    return self;
}

@end
