//
//  CLTextField.h
//  SimpleProject
//
//  Created by Cain on 2017/9/20.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLTextFieldType) {
    
    CLTextFieldButtomNormal = 0, // default
    CLTextFieldButtomLineType
};

@interface CLTextField : UITextField

@property (nonatomic, assign) CLTextFieldType cl_textFieldType;

@property (nonatomic, strong) UIColor *cl_lineColor;

@end
