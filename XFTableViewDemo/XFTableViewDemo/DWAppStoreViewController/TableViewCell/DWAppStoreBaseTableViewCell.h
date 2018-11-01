//
//  DWAppStoreBaseTableViewCell.h
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWAppStoreTableViewCellProtocol.h"
#import "DWBaseContainerViewProtocol.h"

@interface DWAppStoreBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) id <DWBaseContainerViewProtocol> baseContainerView;
@end
