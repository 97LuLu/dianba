//
//  OrderHeaderView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderHeaderView.h"

@implementation OrderHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIImage *image = self.shopImg.image;
//    self.backgroundView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.shopImg.layer.masksToBounds = YES;
    self.shopImg.layer.cornerRadius = 59 / 2;
    
}

@end
