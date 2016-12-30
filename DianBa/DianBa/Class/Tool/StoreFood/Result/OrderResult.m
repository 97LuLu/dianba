//
//  OrderResult.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderResult.h"
#import "OrderMenu.h"

@implementation OrderResult

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"menu_info":[OrderMenu class]};
    
}

@end
