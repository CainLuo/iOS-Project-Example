//
//  InterceptModel.m
//  RunTimeExample
//
//  Created by Cain on 2017/10/1.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "InterceptModel.h"

@implementation InterceptModel

- (void)cl_logInterceptModel {
    
    NSLog(@"Intercept You Method ");
}

+ (void)cl_logInterceptModelClass {
    
    NSLog(@"Intercept Class You Method ");
}

@end
