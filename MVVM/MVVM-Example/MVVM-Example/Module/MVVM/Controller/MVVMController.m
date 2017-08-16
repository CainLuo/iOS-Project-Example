//
//  MVVMController.m
//  MVVM-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "MVVMController.h"
#import "MVVMViewModel.h"

@interface MVVMController ()

@property (nonatomic, strong) MVVMViewModel *mvvmViewModel;

@property (nonatomic, strong, readwrite) UIButton *button;
@property (nonatomic, strong, readwrite) UILabel  *label;

@end

@implementation MVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.label];
    
    [self.mvvmViewModel httpRequest];
}

- (MVVMViewModel *)mvvmViewModel {
    
    if (!_mvvmViewModel) {
        
        _mvvmViewModel = [[MVVMViewModel alloc] initViewModelWithController:self];
    }
    
    return _mvvmViewModel;
}

- (UIButton *)button {
    
    if (!_button) {
        
        _button = [[UIButton alloc] init];
        
        _button.frame = CGRectMake(100, 200, 100, 50);
        
        [_button setTitle:@"打招呼"
                 forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor blueColor]];
        [_button addTarget:self
                    action:@selector(buttonAction)
          forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

- (void)buttonAction {
    
    [self.mvvmViewModel reloadData];
}

- (UILabel *)label {
    
    if (!_label) {
        
        _label = [[UILabel alloc] init];
        
        _label.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50);
    }
    
    return _label;
}

@end
