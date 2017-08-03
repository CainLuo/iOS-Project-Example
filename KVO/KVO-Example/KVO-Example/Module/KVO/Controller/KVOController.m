//
//  KVOController.m
//  KVO-Example
//
//  Created by Cain on 2017/8/3.
//  Copyright © 2017年 lottery. All rights reserved.
//

#import "KVOController.h"
#import "KVOModel.h"

@interface KVOController ()

@property (nonatomic, strong) UILabel *beforeLabel;
@property (nonatomic, strong) UILabel *afterLabel;
@property (nonatomic, strong) UIButton *touchButton;

@property (nonatomic, strong) KVOModel *kvoModel;

@end

@implementation KVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.kvoModel addObserver:self
                    forKeyPath:@"number"
                       options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                       context:nil];
    
    [self.view addSubview:self.beforeLabel];
    [self.view addSubview:self.afterLabel];
    [self.view addSubview:self.touchButton];    
}

#pragma mark - Labels
- (UILabel *)beforeLabel {
    
    if (!_beforeLabel) {
        
        _beforeLabel = [[UILabel alloc] init];
        
        _beforeLabel.frame = CGRectMake(0,
                                        120,
                                        [UIScreen mainScreen].bounds.size.width,
                                        30);
        
        _beforeLabel.text = @"之前的number值为: 0";
    }
    
    return _beforeLabel;
}

- (UILabel *)afterLabel {
    
    if (!_afterLabel) {
        
        _afterLabel = [[UILabel alloc] init];
        
        _afterLabel.frame = CGRectMake(0,
                                       150,
                                       [UIScreen mainScreen].bounds.size.width,
                                       30);
        _afterLabel.text = @"现在的number值为: 0";
    }
    
    return _afterLabel;
}

#pragma mark - Button
- (UIButton *)touchButton {
    
    if (!_touchButton) {
        
        _touchButton = [[UIButton alloc] init];
        _touchButton.frame = CGRectMake(0, 340, [UIScreen mainScreen].bounds.size.width, 50);
        _touchButton.backgroundColor = [UIColor blueColor];
        
        [_touchButton setTitle:@"我变"
                      forState:UIControlStateNormal];
        [_touchButton addTarget:self
                         action:@selector(touchButtonAction)
               forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _touchButton;
}

- (void)touchButtonAction {
    
    self.kvoModel.number = self.kvoModel.number + 1;
}

#pragma mark - Observe
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    if ([keyPath isEqualToString:@"number"] && object == self.kvoModel) {
        
        [change mutableArrayValueForKey:@""];
        
        self.beforeLabel.text = [NSString stringWithFormat:@"之前的number值为: %@", change[@"old"]];
        self.afterLabel.text  = [NSString stringWithFormat:@"现在的number值为: %@", change[@"new"]];
    }
}

- (KVOModel *)kvoModel {
    
    if (!_kvoModel) {
        
        _kvoModel = [[KVOModel alloc] init];
    }
    
    return _kvoModel;
}

- (void)dealloc {
    
    [self.kvoModel removeObserver:self
                       forKeyPath:@"number"];
}

@end
