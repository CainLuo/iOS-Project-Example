//
//  KVCController.m
//  KVC-Example
//
//  Created by Cain on 2017/8/4.
//  Copyright © 2017年 lottery. All rights reserved.
//

#import "KVCController.h"
#import "KVCModel.h"

@interface KVCController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIButton *updataButton;

@property (nonatomic, strong) KVCModel *kvcModel;

@end

@implementation KVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.updataButton];
}

- (KVCModel *)kvcModel {
    
    if (!_kvcModel) {
        
        _kvcModel = [[KVCModel alloc] init];
        
        [_kvcModel setValue:@"小明"
                     forKey:@"name"];
        [_kvcModel setValue:@(18)
                     forKey:@"age"];
        [_kvcModel setValue:@"168"
                     forKey:@"height"];
    }
    
    return _kvcModel;
}

#pragma mark - Labels
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text          = @"个人资料";
        _titleLabel.frame         = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UILabel *)infoLabel {
    
    if (!_infoLabel) {
        
        _infoLabel = [[UILabel alloc] init];
        
        _infoLabel.frame = CGRectMake(20,
                                      80,
                                      [UIScreen mainScreen].bounds.size.width - 40,
                                      300);
        
        _infoLabel.backgroundColor = [UIColor lightGrayColor];
        _infoLabel.numberOfLines = 0;
    }
    
    return _infoLabel;
}

#pragma mark - Button
- (UIButton *)updataButton {
    
    if (!_updataButton) {
        
        _updataButton = [[UIButton alloc] init];
        
        _updataButton.frame = CGRectMake(0,
                                         [UIScreen mainScreen].bounds.size.height - 80,
                                         [UIScreen mainScreen].bounds.size.width,
                                         40);
        
        _updataButton.backgroundColor = [UIColor blueColor];
        
        [_updataButton setTitle:@"更新"
                       forState:UIControlStateNormal];
        [_updataButton addTarget:self
                          action:@selector(updataAction)
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _updataButton;
}

- (void)updataAction {
        
    NSString *name   = [self.kvcModel valueForKeyPath:@"name"];
    NSString *height = [self.kvcModel valueForKeyPath:@"height"];

    NSInteger age = [[self.kvcModel valueForKeyPath:@"age"] integerValue];
    
    self.infoLabel.text = [NSString stringWithFormat:@"名字: %@ \n年龄: %ld \n身高: %@", name, (long)age, height];
    
    [self.kvcModel setValue:@(age + 1)
                     forKey:@"age"];
}

@end
