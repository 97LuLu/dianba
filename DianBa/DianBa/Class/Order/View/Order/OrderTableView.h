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
@property (nonatomic , strong) UIButton *rowingBtn;
@property (nonatomic , strong) UIButton *returnBtn;
@property (nonatomic , strong) UIButton *collectionBtn;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIButton *nReturnBtn;
@property (nonatomic, strong) UIButton *nCollectionBtn;
@property (nonatomic, strong) UILabel *titleLabel;
/*-------------------  购物车  -----------------------*/
@property (nonatomic , strong) UIView *carView;
@property (strong , nonatomic) UIButton *carBtn;
@property (strong , nonatomic) UILabel *badgeLabel;
@property (strong , nonatomic) UILabel *rMBLabel;
@property (strong , nonatomic) UILabel *priceLabel;
@property (strong , nonatomic) UIButton *balanceBtn;

@end
