//
//  DWAppStoreTableViewCellProtocol.h
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DWAppStoreTableViewCellProtocol <NSObject>

//更新TableViewCell数据源
- (void)updateCellWithData:(id)data;

@end
