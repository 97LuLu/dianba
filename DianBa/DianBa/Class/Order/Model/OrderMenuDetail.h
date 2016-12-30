//
//  OrderMenuDetail.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderMenuDetail : NSObject

@property (nonatomic , copy) NSString *ids;
/**
 菜名
 */
@property (nonatomic , copy) NSString *menu_name;
/**
 菜品图片
 */
@property (nonatomic , copy) NSString *photo;
/**
 菜单类型
 */
@property (nonatomic , copy) NSString *menu_type;
/**
 价格
 */
@property (nonatomic , copy) NSString *menu_price;

@property (nonatomic , copy) NSString *stock;
/**
 菜品套餐
 */
@property (nonatomic , copy) NSString *foot_type;

@property (nonatomic , copy) NSString *type_id;

@property (nonatomic , copy) NSString *rated;
/**
 销售额
 */
@property (nonatomic , copy) NSString *count_num;

@end
