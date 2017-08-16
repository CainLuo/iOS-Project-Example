//
//  MVVMViewModel.m
//  MVVM-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "MVVMViewModel.h"
#import "MVVMModel.h"

@interface MVVMViewModel ()

@property (nonatomic, weak) MVVMController *mvvmController;

@property (nonatomic, strong) MVVMModel *baseModel;

@end

@implementation MVVMViewModel

- (instancetype)initViewModelWithController:(MVVMController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.mvvmController = controller;
    }
    
    return self;
}

- (void)httpRequest {
    
    MVVMModel *mvvmModel = [[MVVMModel alloc] init];
    
    mvvmModel.name = @"小明";
    
    self.baseModel = mvvmModel;
}

- (void)reloadData {
    
    self.mvvmController.label.text = [NSString stringWithFormat:@"见到了%@, 打声招呼.", self.baseModel.name];
}

@end
