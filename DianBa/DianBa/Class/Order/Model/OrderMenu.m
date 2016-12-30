//
//  OrderMenu.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderMenu.h"
#import "OrderMenuDetail.h"

@implementation OrderMenu

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"info_list":[OrderMenuDetail class]};
}

@end
