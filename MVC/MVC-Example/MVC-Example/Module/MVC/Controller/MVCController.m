//
//  MVCController.m
//  MVC-Example
//
//  Created by Cain on 2017/8/14.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "MVCController.h"
#import "MVCModel.h"

@interface MVCController ()

@property (nonatomic, strong) MVCModel *mvcModel;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel  *label;

@end

@implementation MVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.label];
}

- (MVCModel *)mvcModel {
    
    if (!_mvcModel) {
        
        _mvcModel = [[MVCModel alloc] init];
        
        [_mvcModel httpRequest];
    }
    
    return _mvcModel;
}

- (UIButton *)button {
    
    if (!_button) {
        
        _button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
        
        [_button setTitle:@"打招呼"
                 forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor blueColor]];
        [_button addTarget:self
                    action:@selector(buttonAction:)
          forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

- (void)buttonAction:(UIButton *)button {
    
    self.label.text = [NSString stringWithFormat:@"中途遇到了%@, 打了声招呼", self.mvcModel.name];
}

- (UILabel *)label {
    
    if (!_label) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
        
        _label.textColor = [UIColor blackColor];
    }
    
    return _label;
}

@end
