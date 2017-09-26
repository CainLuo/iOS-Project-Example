//
//  TestModel+String.m
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "TestModel+String.h"
#import <objc/runtime.h>

static void *TestStringKey = &TestStringKey;

@implementation TestModel (String)

- (void)setTestString:(NSString *)testString {
    
    objc_setAssociatedObject(self, TestStringKey, testString, OBJC_ASSOCIATION_COPY);
}

- (NSString *)testString {
    
    return objc_getAssociatedObject(self, TestStringKey);
}

@end
