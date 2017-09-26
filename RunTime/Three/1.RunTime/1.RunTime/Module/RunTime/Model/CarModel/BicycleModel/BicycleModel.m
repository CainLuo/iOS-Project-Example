//
//  BicycleModel.m
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "BicycleModel.h"
#import "SportsCarModel.h"

#import <objc/runtime.h>

@implementation BicycleModel

- (void)ridingSpeed {
    
    NSLog(@"Slow Ride");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
#if 0
    return NO;
#else
    class_addMethod(self, sel, class_getMethodImplementation(self, sel_registerName("ridingSpeed")), "v@:");
    
    return [super resolveInstanceMethod:sel];
#endif
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
#if 0
    return nil;
#else
    return [[SportsCarModel alloc] init];
#endif
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    return [anInvocation invokeWithTarget:[[SportsCarModel alloc] init]];
}

@end
