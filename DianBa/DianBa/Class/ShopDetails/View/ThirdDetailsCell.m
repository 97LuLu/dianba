//
//  ThirdDetailsCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ThirdDetailsCell.h"

@implementation ThirdDetailsCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 15;
}

@end
