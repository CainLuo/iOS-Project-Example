//
//  RunTimeCategoryController.m
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/4.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeCategoryController.h"
#import "NSObject+CLObject.h"

@interface RunTimeCategoryController ()

@end

@implementation RunTimeCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    self.view.backgroundColor = [UIColor whiteColor];

    NSObject *objc = [[NSObject alloc] init];
    
    objc.categoryName = @"NSObject+CLObject";
    
    NSLog(@"%@", objc.categoryName);
}

@end
