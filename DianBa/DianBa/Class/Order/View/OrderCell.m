//
//  OrderCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

// 快速创建cell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"order";
    
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

@end
