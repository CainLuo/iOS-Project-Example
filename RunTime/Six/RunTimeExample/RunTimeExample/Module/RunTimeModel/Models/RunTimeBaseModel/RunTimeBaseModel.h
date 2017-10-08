//
//  RunTimeBaseModel.h
//  RunTimeExample
//
//  Created by Cain Luo on 2017/10/5.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RunTimeInfoModel.h"
#import "NSObject+CLModel.h"

@interface RunTimeBaseModel : NSObject <ModelDelegate>

@property (nonatomic, copy) NSString *cl_name;
@property (nonatomic, copy) NSString *cl_age;
@property (nonatomic, copy) NSString *cl_phoneNumber;
@property (nonatomic, copy) NSString *cl_height;
@property (nonatomic, copy) NSString *cl_weight;
@property (nonatomic, copy) NSString *cl_addres;

@property (nonatomic, strong) RunTimeInfoModel *info;

@property (nonatomic, strong) NSArray *data;

@end
