//
//  RunTimeMessageModel.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeMessageModel.h"

@implementation RunTimeMessageModel

- (void)cl_post {
    
    NSLog(@"被调用了: %@, 当前对象为: %@", NSStringFromClass([self class]), self);
}

- (void)cl_getWithCount:(NSInteger)count {
    
    NSLog(@"被%ld人调用了", count);
}

@end
