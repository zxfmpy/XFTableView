//
//  DWAppStoreBaseContainerView.m
//  导航栏
//
//  Created by 左晓峰 on 2018/8/10.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppStoreBaseContainerView.h"
#import "DWAppImageTableViewCellViewModel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DWAppStoreContainerView : UIView
@property (nonatomic, strong) UIButton *bgView;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) void (^clickShowDetailCallBack)(UIView *view);
@property (nonatomic, copy) void (^clickShowSmallDetaillCallBack)(UIView *view);
- (void)updateData:(id)data;
@end

@implementation DWAppStoreContainerView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.bgView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.bgView];
        [self.bgView addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

- (void)clickAction:(UIButton *)sender {
    if (self.clickShowDetailCallBack) {
        self.clickShowDetailCallBack(self);
    }
}

- (void)updateData:(id)data {
    self.bgView.frame = CGRectMake(10, 10, self.frame.size.width - 2 * 10, self.frame.size.height - 2*10);
    self.bgView.backgroundColor = [UIColor colorWithRed:0.1 * (arc4random() & 6) green:0.1 * (arc4random() & 6) blue:0.1 * (arc4random() & 6) alpha:1];
}

@end

@interface DWAppStoreBaseContainerView ()
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) DWAppStoreContainerView *containerView;
@property (nonatomic, strong) DWAppImageTableViewCellViewModel *viewModel;
@end

@implementation DWAppStoreBaseContainerView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"当前响应者为:%@",view);
    return view;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mainScrollView = [[UIScrollView alloc] init];
        self.mainScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.mainScrollView];
        if (@available(iOS 11.0, *)) {
            self.mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        self.containerView = [[DWAppStoreContainerView alloc] init];
        [self.mainScrollView addSubview:self.containerView];
        
        __weak typeof(self)weakSelf = self;
        self.containerView.clickShowDetailCallBack = ^(UIView *view) {
            [weakSelf showDetail];
        };
        self.containerView.clickShowSmallDetaillCallBack = ^(UIView *view) {
            [weakSelf showSmallDetail];
        };
        
        self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeBtn.backgroundColor = [UIColor redColor];
        [self.mainScrollView addSubview:self.closeBtn];
        [self.closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)closeBtnAction:(UIButton *)sender {
    [self showSmallDetail];
}

- (void)showDetail {
    
    UIView *controllerView = self.viewModel.controllerView;
    
    CGRect transform = [self.mainScrollView convertRect:self.mainScrollView.frame toView:controllerView];
    self.mainScrollView.frame = transform;
    [controllerView addSubview:self.mainScrollView];
    
    [self.mainScrollView addSubview:self.containerView];
    self.closeBtn.hidden = NO;
    self.closeBtn.frame = CGRectMake(SCREEN_WIDTH - 60, 10, 40, 40);
    self.closeBtn.layer.cornerRadius = 20;
    [self.mainScrollView bringSubviewToFront:self.closeBtn];
    
    [controllerView addSubview:self.closeBtn];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.containerView.bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height + 100);
        self.mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height + 100);
        self.mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(self.containerView.bgView.frame.size.height, 0, 0, 0);
        self.containerView.label.text = @"dsadkjsahdahsdhasdsahdlsa";
        self.containerView.label.frame = CGRectMake(10, self.containerView.bgView.frame.size.height + 10, self.frame.size.width, 40);
    }];
}

- (void)showSmallDetail {
    CGRect rect = [self.mainScrollView convertRect:self.mainScrollView.frame toView:self];
    self.mainScrollView.frame = rect;
    
    [self addSubview:self.mainScrollView];
    self.closeBtn.hidden = YES;
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
        self.containerView.bgView.frame = CGRectMake(10, 10, self.frame.size.width - 2 * 10, self.frame.size.height - 2*10);
        self.mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
    } completion:^(BOOL finished) {
        self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height);
    }];
}

- (void)updateBaseContainerViewWithViewModel:(id)data {
    
    self.viewModel = data;
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.viewModel.tableViewCellHeight);
    
    self.mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.frame.size.height);
    self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
    [self.containerView updateData:data];
    
    
}

@end









