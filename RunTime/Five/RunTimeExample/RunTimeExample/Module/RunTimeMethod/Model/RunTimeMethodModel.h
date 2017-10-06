//
//  RunTimeMethodModel.h
//  RunTimeExample
//
//  Created by Cain on 2017/9/28.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeMethodModel : NSObject

@property (nonatomic, copy) NSString *cl_height;
@property (nonatomic, copy) NSString *cl_weight;

- (NSString *)cl_height;
- (NSString *)cl_weight;

@end
