//
//  RunTimeCoderController.m
//  RunTimeExample
//
//  Created by Mac on 2017/10/8.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeCoderController.h"
#import "RunTimeCoderModel.h"

@interface RunTimeCoderController ()

@property (nonatomic, strong) RunTimeCoderModel *cl_coderModel;

@end

@implementation RunTimeCoderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self cl_coderMethodOne];
    [self cl_decodeingOne];
    
    [self cl_coderMethodTwo];
    [self cl_decodeingTwo];
}

#pragma mark - 归档方法
- (void)cl_coderMethodOne {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/userInfo.text"];
    
    NSMutableData *data = [NSMutableData data];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:self.cl_coderModel
                    forKey:@"cl_coderModel"];
    
    [archiver finishEncoding];

    BOOL result = [data writeToFile:path
                         atomically:YES];
    
    if (result) {
        
        NSLog(@"归档成功:%@", path);
    } else {
        
        NSLog(@"归档失败");
    }
}

- (void)cl_coderMethodTwo {
    
    NSString *homePath = NSHomeDirectory();
    NSString *path = [homePath stringByAppendingPathComponent:@"Library/Caches/userInfo.text"];
    
    [NSKeyedArchiver archiveRootObject:self.cl_coderModel
                                toFile:path];
}

#pragma mark - 解档方法
- (void)cl_decodeingOne {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/userInfo.text"];

    NSData *myData = [NSData dataWithContentsOfFile:path];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    
    RunTimeCoderModel *coderModel = [unarchiver decodeObjectForKey:@"cl_coderModel"];
    
    [unarchiver finishDecoding];
    
    NSLog(@"姓名:%@\n 身高:%@\n 年龄:%@", coderModel.cl_name, coderModel.cl_height, coderModel.cl_age);
}

- (void)cl_decodeingTwo {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/userInfo.text"];
    
    RunTimeCoderModel *coderModel = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"姓名:%@\n 身高:%@\n 年龄:%@", coderModel.cl_name, coderModel.cl_height, coderModel.cl_age);
}

- (RunTimeCoderModel *)cl_coderModel {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_coderModel);
    
    _cl_coderModel = [[RunTimeCoderModel alloc] init];
    
    _cl_coderModel.cl_name = @"小明";
    _cl_coderModel.cl_height = @"170";
    _cl_coderModel.cl_age = @"18";

    return _cl_coderModel;
}

@end
