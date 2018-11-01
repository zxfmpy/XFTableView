//
//  DWAppBanerTableViewCellViewModel.m
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppBanerTableViewCellViewModel.h"
#import "DWBanerView.h"

@implementation DWAppBanerTableViewCellViewModel

- (NSString *)baseContainerViewClass {
    return NSStringFromClass([DWBanerView class]);
}

- (void)startCalculateAllViewFrame {
    
    [DWBanerView startCalculateAllViewFrame:self];
}

@end
