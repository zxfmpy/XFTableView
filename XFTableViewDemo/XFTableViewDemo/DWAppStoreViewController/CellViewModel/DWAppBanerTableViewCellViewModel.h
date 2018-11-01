//
//  DWAppBanerTableViewCellViewModel.h
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppStoreTableViewCellBaseViewModel.h"

@interface DWAppBanerTableViewCellViewModel : DWAppStoreTableViewCellBaseViewModel

@property (nonatomic, assign) CGRect userNameFrame;

@property (nonatomic, copy) void (^clickCallBack)(void);

@end
