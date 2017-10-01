//
//  RunTimeController.m
//  RunTimeExample
//
//  Created by Cain on 2017/9/26.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "RunTimeController.h"
#import "RunTimeDataSource.h"
#import "RunTimeViewModel.h"
#import "RunTimeDelegate.h"

@interface RunTimeController ()

@property (nonatomic, strong) RunTimeDataSource *cl_runTimeDataSource;
@property (nonatomic, strong) RunTimeViewModel  *cl_runTimeViewModel;
@property (nonatomic, strong) RunTimeDelegate   *cl_runTimeDelegate;

@end

@implementation RunTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_removeRefresh];
    self.title = NSStringFromClass([self class]);
    
    [self cl_setTableViewDelegate:self.cl_runTimeDelegate
                       dataSource:self.cl_runTimeDataSource];
    
    [self cl_addConstraintsWithSuperView];
    [self.cl_runTimeViewModel cl_tableViewHTTPRequest];
}

- (RunTimeDelegate *)cl_runTimeDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_runTimeDelegate);
    
    _cl_runTimeDelegate = [[RunTimeDelegate alloc] initTableViewDelegateWithViewModel:self.cl_runTimeViewModel];
    
    return _cl_runTimeDelegate;
}

- (RunTimeDataSource *)cl_runTimeDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_runTimeDataSource);
    
    _cl_runTimeDataSource = [[RunTimeDataSource alloc] initTableViewDataSourceWithViewModel:self.cl_runTimeViewModel];
    
    return _cl_runTimeDataSource;
}

- (RunTimeViewModel *)cl_runTimeViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_runTimeViewModel);
    
    _cl_runTimeViewModel = [[RunTimeViewModel alloc] initTableViewBaseModelWithController:self];
    
    return _cl_runTimeViewModel;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.edges.equalTo(self.view.safeAreaLayoutGuide);
            
        } else {
            make.edges.equalTo(self.view);
        }
    }];
}

@end
