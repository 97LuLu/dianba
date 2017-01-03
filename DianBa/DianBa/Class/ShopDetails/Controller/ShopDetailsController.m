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
#import "FirstDetailsCell.h"
#import "SecondDetailsCell.h"
#import "ThirdDetailsCell.h"

@interface ShopDetailsController ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat _labelH;
    CGFloat _commentLableH;
}
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
    [self.detailsView.returnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 按钮方法
- (void)returnBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth, 42)];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth - 20, 17, 8, 6);
        [button setImage:[UIImage imageWithOriginaName:@"arrows"] forState:UIControlStateNormal];
        [view addSubview:button];
    }
    UILabel *information = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 200, 15)];
    information.text = @[@"商家信息",@"优惠活动",@"用户评价"][section];
    information.font = [UIFont systemFontOfSize:16 weight:1];
    information.textColor = [GVColor hexStringToColor:@"#333333"];
    [view addSubview:information];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth, 30)];
        view.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(StartX, StartY, ScreenWidth, 30);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:@"查看全部评论" forState:UIControlStateNormal];
        [button setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        [view addSubview:button];
        return view;
    }else{
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 42;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 30;
    }
    else{
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 30 + _labelH;
    }
    else if (indexPath.section == 1){
        return 47;
    }
    else{
        self.detailsView.table.estimatedRowHeight = 30;
        self.detailsView.table.rowHeight = UITableViewAutomaticDimension;
        return self.detailsView.table.rowHeight;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *firstID = @"first";
        FirstDetailsCell *firstCell = [tableView dequeueReusableCellWithIdentifier:firstID];
        if (firstCell == nil) {
            firstCell = [[FirstDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:firstID];
        }
        firstCell.firstLabel.text = @"啦拉拉";
        CGFloat x = 12;
        CGFloat y = 15;
        CGFloat w = ScreenWidth - 24;
        CGSize size = [firstCell.firstLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(w, MAXFLOAT)];
        firstCell.firstLabel.frame = CGRectMake(x, y, w, size.height);
        _labelH = firstCell.firstLabel.frame.size.height;
        return firstCell;
    }
    else if (indexPath.section ==1){
        static NSString *secondID = @"second";
        SecondDetailsCell *secondCell = [tableView dequeueReusableCellWithIdentifier:secondID];
        if (secondCell == nil) {
            secondCell = [[NSBundle mainBundle] loadNibNamed:@"SecondDetailsCell" owner:self options:nil].lastObject;
        }
        return secondCell;
    }
    else{
        static NSString *thirdID = @"third";
        ThirdDetailsCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:thirdID];
        if (thirdCell == nil) {
            thirdCell = [[NSBundle mainBundle] loadNibNamed:@"ThirdDetailsCell" owner:self options:nil].lastObject;
        }
        return thirdCell;
    }
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
