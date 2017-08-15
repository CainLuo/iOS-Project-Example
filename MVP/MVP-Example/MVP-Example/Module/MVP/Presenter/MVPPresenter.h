//
//  MVPPresenter.h
//  MVP-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPController.h"

@interface MVPPresenter : NSObject

- (instancetype)initPresenterWithController:(MVPController *)controller;

- (void)reloadData;

@end
