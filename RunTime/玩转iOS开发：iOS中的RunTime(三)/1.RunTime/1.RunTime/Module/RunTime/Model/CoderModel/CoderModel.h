//
//  CoderModel.h
//  1.RunTime
//
//  Created by Cain on 2017/8/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoderModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger phoneNumber;

@end
