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

/**
 菜品ID
 */
@property (nonatomic , copy) NSString *type_id;

/**
 菜品套餐
 */
@property (nonatomic , copy) NSString *foot_type;

@property (nonatomic , strong) NSArray *info_list;

@end
