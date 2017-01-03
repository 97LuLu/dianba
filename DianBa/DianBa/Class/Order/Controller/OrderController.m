//
//  OrderController.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderController.h"
//点餐
#import "OrderTableView.h"
#import "OrderHeaderView.h"
#import "OrderTableViewCell.h"
#import "PurchaseCarAnimationTool.h"
// 蒙版
#import "MaskView.h"
// 菜单
#import "MenuCell.h"
#import "MenuHeaderView.h"
// 数据
#import "OrderData.h"
#import "OrderResult.h"
#import "OrderMenu.h"
// 店铺详情
#import "ShopDetailsController.h"

@interface OrderController ()<UITableViewDelegate,UITableViewDataSource>
/** 门店菜品数组 */
@property (nonatomic , strong) NSMutableArray *storesArr;
@property (nonatomic, strong) OrderResult *result;
@property (nonatomic , strong) OrderTableView *orderView;
@property (nonatomic , strong) OrderHeaderView *headerView;
@property (nonatomic , assign) BOOL isHiddenHot;
@property (nonatomic , strong) MaskView *maskView;
@property (nonatomic , strong) UITapGestureRecognizer *tap;
/** 菜品属性数组 */
@property (nonatomic , strong) NSArray *typeArr;
@property (nonatomic , strong) MenuHeaderView *hotHeaderV;
@end

@implementation OrderController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    _orderView.ordertable.tableHeaderView.height = OrderHeaderHeight;
    _orderView.hotPotTable.tableHeaderView.height = 55;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加tableView
    [self.view addSubview:self.orderView];
    // 加载数据
    [self loadData];
    [self.orderView.returnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.orderView.nReturnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.maskBtn addTarget:self action:@selector(pushToShopDetails:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 按钮方法
- (void)returnBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)pushToShopDetails:(UIButton *)sender{
    [self.navigationController pushViewController:[[ShopDetailsController alloc] init] animated:YES];
}

#pragma mark - 请求数据
- (void)loadData{
    [OrderData storeFoodWithStoreId:@"1" success:^(OrderResult *storeFoods) {
        self.result = storeFoods;
        NSArray *array = storeFoods.menu_info;
        [self.storesArr addObjectsFromArray:array];
        // 头视图内容
        NSString *store_photo = self.result.store_photo;
        [self.headerView.shopImg sd_setImageWithURL:[NSURL URLWithString:store_photo]];
        self.headerView.shopName.text = self.result.store_name;
        self.headerView.shopBrief.text = self.result.store_con;
        self.headerView.backgroundImgView.image = [[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:store_photo]]] blurImageWithRadius:25];
        [self.orderView.ordertable reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return self.storesArr.count;
    }
    else if (tableView.tag == 2) {
        return self.typeArr.count;
    }else{
        return 0;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark warning 点击时的文字颜色
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1) {
        static NSString *indentify = @"indentify";
        OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:self options:nil]lastObject];
        }
        
        OrderMenu *menu = self.storesArr[indexPath.row];
        // 数据
        [cell.shopImg sd_setImageWithURL:[NSURL URLWithString:menu.photo]];
        cell.dishesName.text = menu.menu_name;
        cell.salesLabel.text = [NSString stringWithFormat:@"月售%@份",menu.count_num];
        cell.praiseLabel.text = [NSString stringWithFormat:@"好评率%@%%",menu.rated];
        cell.priceLabel.text = menu.menu_price;
        // 购物车效果
        cell.clickCars = ^(UIImageView *imageView){
            CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
            //获取当前cell 相对于self.view 当前的坐标
            rect.origin.y = rect.origin.y - [tableView contentOffset].y;
            CGRect imageViewRect = imageView.frame;
            imageViewRect.origin.y = rect.origin.y+imageViewRect.origin.y;
            [[PurchaseCarAnimationTool shareTool]startAnimationandView:imageView andRect:imageViewRect andFinisnRect:CGPointMake(62, ScreenHeight-49) andFinishBlock:^(BOOL finisn){
                
                UIView *tabbarBtn = self.orderView.carBtn;
                [PurchaseCarAnimationTool shakeAnimation:tabbarBtn];
            }];
        };
        
        cell.number = ^(NSInteger number){
            self.orderView.priceLabel.text = [NSString stringWithFormat:@"%ld",[cell.priceLabel.text intValue] * number];
            if ([cell.numLabel.text intValue] > 0) {
                self.orderView.badgeLabel.text = [NSString stringWithFormat:@"%ld",number];
                [self shoppingCarWithBadgeLabelIsHidden:NO rmbLabelColor:[UIColor whiteColor] priceLabelColor:[UIColor whiteColor] balanceBtnBackgroundColor:[UIColor colorWithRed:253/250.0 green:173/250.0 blue:19/250.0 alpha:1.0] balanceBtnTitleColor:[UIColor whiteColor]];
            }else{
                [self shoppingCarWithBadgeLabelIsHidden:YES rmbLabelColor:[GVColor hexStringToColor:@"#b3b3b3"] priceLabelColor:[GVColor hexStringToColor:@"#b3b3b3"] balanceBtnBackgroundColor:[GVColor hexStringToColor:@"#7f7f7f"] balanceBtnTitleColor:[GVColor hexStringToColor:@"#e6e6e6"]];
            }
        };
        return cell;
    }
    
    else if (tableView.tag == 2) {
        static NSString *indentify = @"menu";
        MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil]lastObject];
        }
        cell.typeName.text = self.typeArr[indexPath.row];
        return cell;
    }
    
    else{
        return nil;
    }
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1) {
        return OrderCellHeight;
    }
    else if (tableView.tag == 2){
        return 45;
    }
    else{
        return 0;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 购物车
- (void)shoppingCarWithBadgeLabelIsHidden:(BOOL)isHidden rmbLabelColor:(UIColor *)rmbColor priceLabelColor:(UIColor *)priceColor balanceBtnBackgroundColor:(UIColor *)balanceBColor balanceBtnTitleColor:(UIColor *)balanceTColor{
    self.orderView.badgeLabel.hidden = isHidden;
    self.orderView.rMBLabel.textColor = rmbColor;
    self.orderView.priceLabel.textColor = priceColor;
    self.orderView.balanceBtn.backgroundColor = balanceBColor;
    [self.orderView.balanceBtn setTitleColor:balanceTColor forState:UIControlStateNormal];
}

#pragma mark - 侧滑按钮方法
- (void)rowingBtnClcik:(UIButton *)sender{
    _isHiddenHot = !_isHiddenHot;
    if (_isHiddenHot == YES) {
        [self showMenu];
    }else{
        [self hiddenMenu];
    }
    [_orderView.ordertable reloadData];
}
// 点击手势
- (void)tapGesture:(UITapGestureRecognizer *)tap{
    _isHiddenHot = !_isHiddenHot;
    [self showMenu];
}
// 显示菜单列表
- (void)showMenu{
    _orderView.ordertable.tableHeaderView.hidden = NO;
    _orderView.ordertable.tableHeaderView.height = OrderHeaderHeight;
    [self hiddenNavigationBar];
    _orderView.ordertable.frame = CGRectMake(StartX, -20, ScreenWidth, ScreenHeight + 20);
    _orderView.ordertable.scrollEnabled = YES;
    // 移除火锅配菜tableView
    [_orderView.hotPotTable removeFromSuperview];
    _orderView.rowingBtn.frame = CGRectMake(StartX, 378, 26, 80);
    [self.maskView removeFromSuperview];
}
// 隐藏菜单
- (void)hiddenMenu{
    _orderView.ordertable.tableHeaderView.hidden = YES;
    _orderView.ordertable.tableHeaderView.height = 0;
    [self setUpNavigationBar];
    _orderView.ordertable.frame = CGRectMake(235, StartY, ScreenWidth, ScreenHeight);
    _orderView.ordertable.scrollEnabled = NO;
    // 添加火锅配菜tableView
    [_orderView addSubview:_orderView.hotPotTable];
    _orderView.rowingBtn.frame = CGRectMake(235, 378, 26, 80);
    [_orderView.ordertable addSubview:self.maskView];
}

#pragma mark - 导航条的显示及隐藏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > 40) {
            [UIView animateWithDuration:0.5 animations:^{
                [self setUpNavigationBar];
            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                [self.view addSubview:_orderView.returnBtn];
                [self.view addSubview:_orderView.collectionBtn];
                [self hiddenNavigationBar];
            }];
        }
    }
    else if (scrollView.tag == 2){
        [self setUpNavigationBar];
    }
}
// 添加导航条
- (void)setUpNavigationBar{
    self.orderView.navigationView.hidden = NO;
    self.orderView.titleLabel.text = self.headerView.shopName.text;
}
// 隐藏导航条
-(void)hiddenNavigationBar{
    self.orderView.navigationView.hidden = YES;
}

#pragma mark - 懒加载
-(MaskView *)maskView{
    if (_maskView == nil) {
        _maskView = [[MaskView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth - 235, ScreenHeight)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [_maskView addGestureRecognizer:tap];
        self.tap = tap;
    }
    return _maskView;
}
- (NSArray *)typeArr{
    if (_typeArr == nil) {
        self.typeArr = @[@"全部",@"甜品",@"烧烤",@"主食",@"酒水"];
    }
    return _typeArr;
}
-(OrderTableView *)orderView{
    if (_orderView == nil) {
        _orderView = [[OrderTableView alloc] initWithFrame:self.view.bounds];
        // 点餐
        _orderView.ordertable.delegate = self;
        _orderView.ordertable.dataSource = self;
        _orderView.ordertable.tableHeaderView = self.headerView;
        // 火锅
        _orderView.hotPotTable.delegate = self;
        _orderView.hotPotTable.dataSource = self;
        _orderView.hotPotTable.tableHeaderView = self.hotHeaderV;
        // 固定按钮
        _isHiddenHot = YES;
        [_orderView.rowingBtn addTarget:self action:@selector(rowingBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderView;
}
-(OrderHeaderView *)headerView{
    if (_headerView == nil) {
        self.headerView = [[NSBundle mainBundle] loadNibNamed:@"OrderHeaderView" owner:self options:nil].lastObject;
        self.headerView.frame = CGRectMake(StartX, StartY, 100, 100);
    }
    return _headerView;
}
-(MenuHeaderView *)hotHeaderV{
    if (_hotHeaderV == nil) {
        _hotHeaderV = [[NSBundle mainBundle] loadNibNamed:@"MenuHeaderView" owner:self options:nil].lastObject;
        _hotHeaderV.frame = CGRectMake(StartX, StartY, 235, 55);
    }
    return _hotHeaderV;
}
- (NSMutableArray *)storesArr{
    if (_storesArr == nil) {
        self.storesArr = [[NSMutableArray alloc] init];
    }
    return _storesArr;
}
- (OrderResult *)result{
    if (_result == nil) {
        _result = [[OrderResult alloc] init];
    }
    return _result;
}
@end
