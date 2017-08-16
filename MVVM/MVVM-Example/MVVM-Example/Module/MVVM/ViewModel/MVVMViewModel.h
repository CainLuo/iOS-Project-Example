//
//  MVVMViewModel.h
//  MVVM-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMController.h"

@interface MVVMViewModel : NSObject

- (instancetype)initViewModelWithController:(MVVMController *)controller;

- (void)httpRequest;
- (void)reloadData;

@end
