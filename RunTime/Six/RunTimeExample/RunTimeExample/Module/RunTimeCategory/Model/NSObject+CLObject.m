//
//  NSObject+CLObject.m
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/4.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "NSObject+CLObject.h"

#import <objc/runtime.h>

@implementation NSObject (CLObject)

- (void)setCategoryName:(NSString *)categoryName {
    
    objc_setAssociatedObject(self, @"categoryName", categoryName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)categoryName {
    
    return objc_getAssociatedObject(self, @"categoryName");
}

@end
