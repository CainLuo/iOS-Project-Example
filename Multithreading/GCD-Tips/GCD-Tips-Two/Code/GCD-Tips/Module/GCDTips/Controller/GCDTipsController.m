//
//  GCDTipsController.m
//  GCD-Tips
//
//  Created by Cain on 2017/9/23.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "GCDTipsController.h"
#import "GCDModel.h"

@interface GCDTipsController ()

@end

@implementation GCDTipsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"开始执行");
    
//    [self queueGroup];
//    [self gourpEnterAndLeave];
//    [self queueBarrier];
//    [self setContext];
    [self objectAndContext];
}

- (void)queueGroup {

    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务, 当前线程为:%@", [NSThread currentThread]);
    });
}

- (void)gourpEnterAndLeave {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);

    [self urlRequestSuccess:^{
        
        NSLog(@"网络请求成功, 当前线程:%@", [NSThread currentThread]);
        
        dispatch_group_leave(group);
    } failure:^{
        
        NSLog(@"网络请求失败, 当前线程:%@", [NSThread currentThread]);

        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        NSLog(@"任务处理完毕, 当前线程:%@", [NSThread currentThread]);
    });
}

- (void)urlRequestSuccess:(void(^)(void))success
                  failure:(void(^)(void))failure {
    
    success();
//    failure();
}

- (void)queueBarrier {
    
    dispatch_queue_t queue = dispatch_queue_create("queueBarrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        
        NSLog(@"执行一, 当前线程:%@", [NSThread currentThread]);
    });
    
    dispatch_barrier_sync(queue, ^{
        
        NSLog(@"大佬来了, 当前线程:%@", [NSThread currentThread]);
    });

    dispatch_sync(queue, ^{
        
        NSLog(@"执行二, 当前线程:%@", [NSThread currentThread]);
    });
}

#pragma mark - dispatch_set_context与dispatch_set_finalizer_f
typedef struct _Info {
    int age;
} Info;

void cleanStaff(void *context) {
    
    NSLog(@"In clean, context age: %d", ((Info *)context)->age);
    
    //释放，如果是new出来的对象，就要用delete
    free(context);
}

- (void)setContext {
    
    dispatch_queue_t queue = dispatch_queue_create("contextQueue", DISPATCH_QUEUE_SERIAL);
    
    // 初始化Data对象, 并且设置初始化值
    Info *myData = malloc(sizeof(Info));
    myData->age = 100;
    
    // 绑定Context
    dispatch_set_context(queue, myData);
    
    // 设置finalizer函数，用于在队列执行完成后释放对应context内存
    dispatch_set_finalizer_f(queue, cleanStaff);

    dispatch_async(queue, ^{
        
        //获取队列的context数据
        Info *data = dispatch_get_context(queue);
        //打印
        NSLog(@"1: context age: %d", data->age);
        //修改context保存的数据
        data->age = 20;
    });
}

#pragma mark - NSObject And dispatch_set_context
void cleanObjectStaff(void *context) {
    
    GCDModel *model = (__bridge GCDModel *)context;
    
    NSLog(@"In clean, context age: %ld", model.age);
    
    // 释放内存
    CFRelease(context);
}

- (void)objectAndContext {
    
    dispatch_queue_t queue = dispatch_queue_create("objectQueue", DISPATCH_QUEUE_SERIAL);
    
    // 初始化Data对象, 并且设置初始化值
    GCDModel *model = [[GCDModel alloc] init];
    model.age = 20;
    
    // 绑定Context, 这里使用__bridge关键
    dispatch_set_context(queue, (__bridge_retained void *)(model));
    
    // 设置finalizer函数，用于在队列执行完成后释放对应context内存
    dispatch_set_finalizer_f(queue, cleanObjectStaff);
    
    dispatch_async(queue, ^{
        
        //获取队列的context数据
        GCDModel *model = (__bridge GCDModel *)(dispatch_get_context(queue));
        //打印
        NSLog(@"1: context age: %ld", model.age);
        //修改context保存的数据
        model.age = 120;
    });
}

@end
