//
//  OrderTableView.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableView : UIView

@property (nonatomic , strong) UITableView *ordertable;
@property (nonatomic , strong) UITableView *hotPotTable;
@property (nonatomic , strong) UIButton *rowingBtn;//两表切换
@property (nonatomic , strong) UIButton *returnBtn;//返回按钮
@property (nonatomic , strong) UIButton *collectionBtn;//收藏
/*-------------------  购物车  -----------------------*/
@property (nonatomic , strong) UIView *carView;
@property (strong , nonatomic) UIButton *carBtn;
@property (strong , nonatomic) UILabel *badgeLabel;
@property (strong , nonatomic) UILabel *rMBLabel;
@property (strong , nonatomic) UILabel *priceLabel;
@property (strong , nonatomic) UIButton *balanceBtn;

@end
