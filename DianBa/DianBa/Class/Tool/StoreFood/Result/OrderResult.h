//
//  OrderResult.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderResult : NSObject<MJKeyValue>

@property (nonatomic , copy) NSString *shopId;

/**
 店铺简介
 */
@property (nonatomic , copy) NSString *store_con;

/**
 店铺图片
 */
@property (nonatomic , copy) NSString *store_photo;

/**
 店铺名称
 */
@property (nonatomic , copy) NSString *store_name;

/**
 菜单
 */
@property (nonatomic , strong) NSArray *menu_info;

@end
