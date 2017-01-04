//
//  DetailsTableViewController.h
//  DianBa
//
//  Created by Hunter on 2017/1/2.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsTableViewController : UITableViewController

/**
 返回
 */
@property (nonatomic, strong) UIButton *backButton;

/**
 购物车
 */
@property (nonatomic, strong) UIButton *shoppingCartButton;

/**
 头视图
 */
@property (nonatomic, strong) UIView *headView;

/**
 菜品图片
 */
@property (nonatomic, strong) UIImageView *headerImage;

/**
 名称
 */
@property (nonatomic, strong) UILabel *nameLabel;

/**
 销量
 */
@property (nonatomic, strong) UILabel *salesLabel;

/**
 价格
 */
@property (nonatomic, strong) UILabel *priceLabel;

/**
 添加按钮
 */
@property (nonatomic, strong) UIButton *addButton;

/**
 特色说明
 */
@property (nonatomic, strong) UILabel *FeaturesLabel;

/**
 特色说明内容
 */
@property (nonatomic, strong) UILabel *FeaturesTextLabel;

/**
 分割线
 */
@property (nonatomic, strong) UILabel * label;
@end
