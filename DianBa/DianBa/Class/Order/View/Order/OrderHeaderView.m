//
//  OrderHeaderView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年wangchenlu. All rights reserved.
//

#import "OrderHeaderView.h"

@implementation OrderHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    _shopImg.layer.masksToBounds = YES;
    _shopImg.layer.cornerRadius = 59 / 2;
//    [];
    
}

@end
