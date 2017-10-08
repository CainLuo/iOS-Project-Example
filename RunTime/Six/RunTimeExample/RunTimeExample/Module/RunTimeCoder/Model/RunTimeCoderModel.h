//
//  RunTimeCoderModel.h
//  RunTimeExample
//
//  Created by Mac on 2017/10/8.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeCoderModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *cl_name;
@property (nonatomic, copy) NSString *cl_height;
@property (nonatomic, copy) NSString *cl_age;

@end
