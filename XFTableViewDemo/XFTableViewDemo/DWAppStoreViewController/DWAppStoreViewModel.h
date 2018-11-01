//
//  DWAppStoreViewModel.h
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DWAppStoreTableViewCellBaseViewModel.h"

@interface DWAppStoreViewModel : NSObject

@property (nonatomic, strong) NSMutableArray <DWAppStoreTableViewCellBaseViewModel*> *datas;

@property (nonatomic, weak) UIView *view;

- (void)requestData:(void(^)(void))successCallBack;

@end
