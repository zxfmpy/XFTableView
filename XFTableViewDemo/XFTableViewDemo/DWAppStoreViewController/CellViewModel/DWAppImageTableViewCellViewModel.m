//
//  DWAppImageTableViewCellViewModel.m
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppImageTableViewCellViewModel.h"
#import "DWAppStoreBaseContainerView.h"

@implementation DWAppImageTableViewCellViewModel
- (NSString *)baseContainerViewClass {
    return NSStringFromClass([DWAppStoreBaseContainerView class]);
}

- (void)startCalculateAllViewFrame {
    self.tableViewCellHeight = random()%200;
}


@end
