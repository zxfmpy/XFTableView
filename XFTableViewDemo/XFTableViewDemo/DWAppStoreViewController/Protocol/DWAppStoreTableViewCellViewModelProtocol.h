//
//  DWAppStoreTableViewCellViewModelProtocol.h
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DWAppStoreTableViewCellViewModelProtocol <NSObject>

//返回指定的TableViewCell，这里面完成TableViewCell的创建
- (id)retTableViewCellWithTableView:(UITableView *)tableView;

//返回当前cell的高度
- (CGFloat)cellHeight;

//内容基类自定义ViewClass名称
- (NSString *)baseContainerViewClass;

//开始计算所有View的Frame
- (void)startCalculateAllViewFrame;

@end
