//
//  RunTimeDelegate.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeDelegate.h"
#import "RunTimeModel.h"

@implementation RunTimeDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    RunTimeModel *model = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    UIViewController *viewController = [[NSClassFromString(model.cl_controllerString) alloc] init];
    
    [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:viewController
                                                                             animated:YES];
}

@end
