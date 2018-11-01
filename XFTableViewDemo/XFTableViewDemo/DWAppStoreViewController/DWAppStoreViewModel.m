//
//  DWAppStoreViewModel.m
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppStoreViewModel.h"
#import "DWAppStoreOrderViewModel.h"
#import "DWAppBanerTableViewCellViewModel.h"
#import "DWAppImageTableViewCellViewModel.h"

@implementation DWAppStoreViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.datas = [NSMutableArray array];
    }
    return self;
}

- (void)requestData:(void(^)(void))successCallBack {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //模拟网络请求
        for (NSInteger i = 0; i < 100; i ++) {
             if (i == 1) {
                DWAppBanerTableViewCellViewModel *bannerViewModel = [[DWAppBanerTableViewCellViewModel alloc] init];
                bannerViewModel.tableViewCellHeight = 50;
                [bannerViewModel startCalculateAllViewFrame];
                
                bannerViewModel.clickCallBack = ^{
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示" message:@"响应到点击事件" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
                    [alertView show];
                };
                
                [self.datas addObject:bannerViewModel];
            }else {
                DWAppImageTableViewCellViewModel *baseAppViewModel = [[DWAppImageTableViewCellViewModel alloc] init];
                baseAppViewModel.controllerView = self.view;
                [baseAppViewModel startCalculateAllViewFrame];
                
                [self.datas addObject:baseAppViewModel];
            }
        }
        
        if (successCallBack) {
            successCallBack();
        }
    });
}

@end
