//
//  MVPPresenter.m
//  MVP-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "MVPPresenter.h"

@interface MVPPresenter ()

@property (nonatomic, weak) MVPController *mvpController;

@end

@implementation MVPPresenter

- (instancetype)initPresenterWithController:(MVPController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.mvpController = controller;
    }
    
    return self;
}

- (void)reloadData {
    
    self.mvpController.label.text = @"看到小明, 和他打了声招呼";
}

@end
