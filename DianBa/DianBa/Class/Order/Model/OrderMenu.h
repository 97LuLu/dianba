//
//  OrderMenu.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderMenuDetail;

@interface OrderMenu : NSObject<MJKeyValue>

/** 菜品ID */
@property (nonatomic , copy) NSString *Id;
/** 月销售额 */
@property (nonatomic, copy) NSString *count_num;
/** 菜品套餐 */
@property (nonatomic, copy) NSString *foot_type;
/** 菜名 */
@property (nonatomic, copy) NSString *menu_name;
/** 价格 */
@property (nonatomic, copy) NSString *menu_price;
/** 菜品类型 */
@property (nonatomic, copy) NSString *menu_type;
/** 菜品图片 */
@property (nonatomic, copy) NSString *photo;
/** 好评率 */
@property (nonatomic, copy) NSString *rated;
/** 原价 */
@property (nonatomic, copy) NSString *stock;

@end
