//
//  DWAppStoreTableViewCellBaseViewModel.h
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DWAppStoreTableViewCellViewModelProtocol.h"
#import "DWAppStoreTableViewCellProtocol.h"
#import "DWAppStoreBaseTableViewCell.h"

@interface DWAppStoreTableViewCellBaseViewModel : NSObject <DWAppStoreTableViewCellViewModelProtocol>

@property (nonatomic, assign) CGFloat tableViewCellHeight;
@property (nonatomic, assign) CGRect containerFrame;

//一般情况下是屏幕宽度，特殊的需要自己在外面指定宽度哦
@property (nonatomic, assign) CGFloat tableViewCellWidth;//default 屏幕宽度

@property (nonatomic, strong) id <DWBaseContainerViewProtocol> baseContainerView;

@end
