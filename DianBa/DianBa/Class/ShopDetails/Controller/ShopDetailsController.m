//
//  ShopDetailsController.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsController.h"
#import "ShopDtailsHeader.h"
#import "ShopDetailsView.h"

@interface ShopDetailsController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) ShopDtailsHeader *header;
@property (nonatomic, strong)ShopDetailsView *detailsView;
@end

@implementation ShopDetailsController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.detailsView];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"details";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 懒加载
- (ShopDtailsHeader *)header{
    if (_header == nil) {
        _header = [[ShopDtailsHeader alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 220)];
    }
    return _header;
}
- (ShopDetailsView *)detailsView{
    if (_detailsView == nil) {
        _detailsView = [[NSBundle mainBundle] loadNibNamed:@"ShopDetailsView" owner:self options:nil].lastObject;
        _detailsView.frame = self.view.frame;
        _detailsView.table.tableHeaderView = self.header;
        // 代理
        _detailsView.table.delegate = self;
        _detailsView.table.dataSource = self;
    }
    return _detailsView;
}
@end
