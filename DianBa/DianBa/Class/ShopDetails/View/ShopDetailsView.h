//
//  ShopDetailsView.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopDetailsView : UIView

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
/** 返回按钮 */
@property (strong, nonatomic) IBOutlet UIButton *returnBtn;
/** 店铺名称 */
@property (strong, nonatomic) IBOutlet UILabel *shopName;
/** 星星背景 */
@property (strong, nonatomic) IBOutlet UIView *starView;
/** 成交份 */
@property (strong, nonatomic) IBOutlet UILabel *dealLabel;
/** 星星 */
@property (nonatomic, strong) StarsView *star;

@property (strong, nonatomic) IBOutlet UITableView *table;


@end
