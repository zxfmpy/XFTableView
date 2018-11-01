//
//  DWBanerView.m
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWBanerView.h"
#import "DWAppBanerTableViewCellViewModel.h"

@interface DWBanerView ()
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic, strong) DWAppBanerTableViewCellViewModel *viewModel;
@end

@implementation DWBanerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = [UIColor redColor];
        [self addSubview:self.nameLabel];
        
        UITapGestureRecognizer *tapGester = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [self addGestureRecognizer:tapGester];
        
    }
    return self;
}

- (void)tapGesture:(UITapGestureRecognizer *)tap {
    if (self.viewModel.clickCallBack) {
        self.viewModel.clickCallBack();
    }
}

- (void)updateBaseContainerViewWithViewModel:(id)data {
    
    self.viewModel = data;
    
    self.frame = self.viewModel.containerFrame;
    self.backgroundColor = [UIColor redColor];
    
    self.nameLabel.text = @"ABC";
    self.nameLabel.frame = self.viewModel.userNameFrame;
}

#pragma mark public methods
+ (void)startCalculateAllViewFrame:(id)data {
    DWAppBanerTableViewCellViewModel *viewModel = (DWAppBanerTableViewCellViewModel *)data;
    viewModel.userNameFrame = CGRectMake(15, 20, 100, 40);
    viewModel.containerFrame = CGRectMake(0, 0, viewModel.tableViewCellWidth, viewModel.userNameFrame.size.height + 2 * 20);
    viewModel.tableViewCellHeight = viewModel.containerFrame.size.height;
}



@end
