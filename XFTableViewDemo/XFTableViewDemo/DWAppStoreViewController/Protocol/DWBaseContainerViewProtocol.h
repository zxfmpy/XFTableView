//
//  DWBaseContainerViewProtocol.h
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DWBaseContainerViewProtocol <NSObject>

//更新TableViewCell数据源
- (void)updateBaseContainerViewWithViewModel:(id)data;

@end
