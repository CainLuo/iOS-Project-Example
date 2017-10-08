//
//  RunTimeViewModel.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeViewModel.h"
#import "RunTimeModel.h"

@implementation RunTimeViewModel

- (void)cl_tableViewHTTPRequest {

    NSArray *dataSource = @[@{@"cl_titleString":@"RunTimeMessage",
                              @"cl_controllerString":@"RunTimeMessageController"},
                            @{@"cl_titleString":@"RunTimeMethod",
                              @"cl_controllerString":@"RunTimeMethodController"},
                            @{@"cl_titleString":@"RunTimeIntercept",
                              @"cl_controllerString":@"RunTimeInterceptController"},
                            @{@"cl_titleString":@"RunTimeCategory",
                              @"cl_controllerString":@"RunTimeCategoryController"},
                            @{@"cl_titleString":@"RunTimeModel",
                              @"cl_controllerString":@"RunTimeModelController"},
                            @{@"cl_titleString":@"RunTimeCoder",
                              @"cl_controllerString":@"RunTimeCoderController"}];
    
    [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[RunTimeModel class]
                                                                       json:dataSource]];    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self cl_configTableViewWithDataSource];
}

@end
