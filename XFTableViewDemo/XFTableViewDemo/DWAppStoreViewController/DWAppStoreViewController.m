//
//  DWAppStoreViewController.m
//  导航栏
//
//  Created by 左晓峰 on 2018/7/30.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "DWAppStoreViewController.h"
#import "DWAppStoreViewModel.h"

@interface DWAppStoreViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DWAppStoreViewModel *viewModel;
@end

@implementation DWAppStoreViewController

#pragma mark ViewLifeCycle
- (void)dealloc {
    NSLog(@"DWAppStoreViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUIAppearance];
    
    [self configData];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark config
- (void)configureUIAppearance{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    self.topView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.topView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.topView.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
}

- (void)configData {
    self.viewModel = [[DWAppStoreViewModel alloc] init];
    self.viewModel.view = self.view;
    [self.viewModel requestData:^{
        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDelegate And UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel.datas[indexPath.row] retTableViewCellWithTableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel.datas[indexPath.row] cellHeight];
}

@end







