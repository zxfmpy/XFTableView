//
//  DWBanerView.h
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWBaseContainerViewProtocol.h"

@interface DWBanerView : UIView <DWBaseContainerViewProtocol>

//更新TableViewCell数据源
- (void)updateBaseContainerViewWithViewModel:(id)data;

+ (void)startCalculateAllViewFrame:(id)data;


@end
