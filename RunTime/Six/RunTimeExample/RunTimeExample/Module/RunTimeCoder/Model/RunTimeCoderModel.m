//
//  RunTimeCoderModel.m
//  RunTimeExample
//
//  Created by Mac on 2017/10/8.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeCoderModel.h"

#import <objc/runtime.h>

@implementation RunTimeCoderModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
//    [aCoder encodeObject:_cl_name
//                  forKey:@"name"];
//    [aCoder encodeObject:_cl_height
//                  forKey:@"height"];
//    [aCoder encodeObject:_cl_age
//                  forKey:@"age"];
    
    [self cl_runtimeEncoderWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    
    if (self) {
        
//        self.cl_name   = [aDecoder decodeObjectForKey:@"name"];
//        self.cl_height = [aDecoder decodeObjectForKey:@"height"];
//        self.cl_age    = [aDecoder decodeObjectForKey:@"age"];
        
        [self cl_runtimeDecideWithCoder:aDecoder];
    }
    
    return self;
}

#pragma mark - 使用RunTime归档
- (void)cl_runtimeEncoderWithCoder:(NSCoder *)coder {
    
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivarList[i];
        
        const char *name = ivar_getName(ivar);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [coder encodeObject:value
                     forKey:key];
    }
    
    free(ivarList);
}

- (void)cl_runtimeDecideWithCoder:(NSCoder *)decoder {
    
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivarList[i];
        
        const char *name = ivar_getName(ivar);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [decoder decodeObjectForKey:key];
        
        [self setValue:value
                forKey:key];
    }
    
    free(ivarList);
}

@end
