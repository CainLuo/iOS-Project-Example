//
//  MVPController.m
//  MVP-Example
//
//  Created by Cain on 2017/8/15.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "MVPController.h"
#import "MVPPresenter.h"

@interface MVPController ()

@property (nonatomic, strong) MVPPresenter *presenter;

@property (nonatomic, strong, readwrite) UIButton *button;
@property (nonatomic, strong, readwrite) UILabel  *label;

@end

@implementation MVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.label];
}

- (MVPPresenter *)presenter {
    
    if (!_presenter) {
        
        _presenter = [[MVPPresenter alloc] initPresenterWithController:self];
    }
    
    return _presenter;
}

- (UIButton *)button {
    
    if (!_button) {
        
        _button = [[UIButton alloc] init];
        
        _button.frame = CGRectMake(100, 200, 100, 50);
        
        [_button setTitle:@"打招呼"
                 forState:UIControlStateNormal];
        [_button addTarget:self
                    action:@selector(hello)
          forControlEvents:UIControlEventTouchUpInside];
        
        [_button setBackgroundColor:[UIColor blueColor]];
    }
    
    return _button;
}

- (void)hello {
    
    [self.presenter reloadData];
}

- (UILabel *)label {
    
    if (!_label) {
        
        _label = [[UILabel alloc] init];
        
        _label.frame     = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50);
        _label.textColor = [UIColor blackColor];
    }
    
    return _label;
}

@end
