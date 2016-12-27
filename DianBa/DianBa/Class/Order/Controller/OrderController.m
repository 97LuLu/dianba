//
//  OrderController.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderController.h"
#import "OrderHeaderView.h"
#import "OrderCell.h"
#import "OrderTableView.h"

@interface OrderController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) OrderTableView *orderView;
@property (nonatomic , strong) OrderHeaderView *headerView;

@end

#define OrderHeaderHeight 166
#define OrderCellHeight 85

@implementation OrderController

-(OrderTableView *)orderView{
    
    if (_orderView == nil) {
        self.orderView = [[OrderTableView alloc] initWithFrame:self.view.bounds];
        self.orderView.ordertable.delegate = self;
        self.orderView.ordertable.dataSource = self;
        [self.orderView.ordertable registerNib:[UINib nibWithNibName:@"OrderCell" bundle:nil] forCellReuseIdentifier:@"order"];
    }
    
    return _orderView;
}

-(OrderHeaderView *)headerView{
    
    if (_headerView == nil) {
        self.headerView = [[NSBundle mainBundle] loadNibNamed:@"OrderHeaderView" owner:self options:nil].lastObject;
        self.headerView.frame = CGRectMake(0, 0, 100, 100);
    }
    
    return _headerView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加tableView
    self.view = self.orderView;
    
}

// 导航条的显示及隐藏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 40) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.navigationController.navigationBar.hidden = NO;
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.navigationController.navigationBar.hidden = YES;
            
        }];
        
    }
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderCell *cell = [OrderCell cellWithTableView:tableView];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return OrderCellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return OrderHeaderHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerView;
}

@end
