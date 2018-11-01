//
//  DWAppStoreTableViewCellBaseViewModel.m
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppStoreTableViewCellBaseViewModel.h"

@implementation DWAppStoreTableViewCellBaseViewModel

- (void)dealloc {
//    NSLog(@"%@ dealloc",self);
}

- (instancetype)init {
    if (self = [super init]) {
        self.tableViewCellHeight = 0;
        self.tableViewCellWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

//返回指定的TableViewCell，这里面完成TableViewCell的创建
- (id)retTableViewCellWithTableView:(UITableView *)tableView {
    
    NSString *cellId = NSStringFromClass([self class]);
    DWAppStoreBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        [tableView registerClass:[DWAppStoreBaseTableViewCell class] forCellReuseIdentifier:cellId];
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    id bannerView = nil;
    if (cell.baseContainerView) {
        bannerView = cell.baseContainerView;
    } else {
        bannerView = [[NSClassFromString([self baseContainerViewClass]) alloc] init];
        [cell.contentView addSubview:bannerView];
        cell.baseContainerView = bannerView;
    }

    if ([cell.baseContainerView respondsToSelector:@selector(updateBaseContainerViewWithViewModel:)]) {
        [cell.baseContainerView updateBaseContainerViewWithViewModel:self];
    }
    
    return cell;
}

#pragma mark DWAppStoreTableViewCellViewModelProtocol
//返回当前cell的高度
- (CGFloat)cellHeight {
    
    return self.tableViewCellHeight;
}

//由子类实现
- (NSString *)baseContainerViewClass {
    return @"UIView";
}

//由子类实现用于计算等Frame
- (void)startCalculateAllViewFrame {
    self.tableViewCellHeight = 0;
}

@end
