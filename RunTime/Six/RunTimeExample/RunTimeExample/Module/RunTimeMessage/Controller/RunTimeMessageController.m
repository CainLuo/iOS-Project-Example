//
//  RunTimeMessageController.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeMessageController.h"
#import "RunTimeMessageModel.h"

#import <objc/message.h>

@interface RunTimeMessageController ()

@end

@implementation RunTimeMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    Class getClass = objc_getClass("RunTimeMessageModel");
    
    NSLog(@"Get The Class is: %@", getClass);
    
    // Xcode 会自动屏蔽通过objc_msgSend创建对象, 我们可以去到工程里设置
    // Build Setting -> Enable Strict Checking of objc_msgSend Calls 改成No就好了.
    RunTimeMessageModel *messageModel = objc_msgSend(getClass, @selector(alloc));
    
    NSLog(@"alloc Object: %@", messageModel);
    
    // 在不调用init方法, 我们也可以通过发消息调用想用的方法, 这里调用没有在.h文件里声明的方法会警告该方法没有声明
    objc_msgSend(messageModel, @selector(cl_post));
    
    messageModel = objc_msgSend(messageModel, @selector(init));
    
    NSLog(@"init Object: %@", messageModel);
    
    objc_msgSend(messageModel, @selector(cl_post));
    
    // 还有另外一种写法, 就是把所有东西都集合在一起, 也就是我们常用的[[NSObject alloc] init];的原型
    RunTimeMessageModel *messageModelTwo = objc_msgSend(objc_msgSend(objc_getClass("RunTimeMessageModel"), @selector(alloc)), @selector(init));
    
    objc_msgSend(messageModelTwo, @selector(cl_getWithCount:), 5);
}

@end
