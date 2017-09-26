//
//  RunTimeModel.m
//  1.RunTime
//
//  Created by Cain on 2017/8/21.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeModel.h"
#import <objc/message.h>
#import <objc/objc.h>

@implementation RunTimeModel

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        [self sendMessage];
        [self sendMessage:100];
        
        [self getClassMethods];
    }
    
    return self;
}


- (void)sendMessage {
    
    NSLog(@"Message");
}

- (void)sendMessage:(NSInteger)messageCount {
    
    NSLog(@"Message: %ld", messageCount);
}

- (void)getClassMethods {
    
    NSObject *obj = [[NSObject alloc] init];
    
    unsigned int methodCount = 0;
    
    const char *className = class_getName([obj class]);
    
    Class metaClass = objc_getMetaClass(className);
    
    Method *methodList = class_copyMethodList(metaClass, &methodCount);
    
    for (int i = 0; i < methodCount; i++) {
        
        Method method = methodList[i];
        
        SEL selector = method_getName(method);
        
        const char *methodName = sel_getName(selector);
        
        NSLog(@"%s", methodName);
    }
}

@end
