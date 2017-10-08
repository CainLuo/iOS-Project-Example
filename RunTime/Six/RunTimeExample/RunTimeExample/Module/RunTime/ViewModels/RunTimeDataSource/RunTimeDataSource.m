//
//  RunTimeDataSource.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeDataSource.h"
#import "RunTimeCell.h"

@implementation RunTimeDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RunTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RunTimeCell"];
    
    if (!cell) {
        
        cell = [[RunTimeCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:@"RunTimeCell"];
    }
    
    [cell cl_confgiRunTimeCellWithModel:self.cl_viewModel.cl_dataSource[indexPath.row]];
    
    return cell;
}

@end
