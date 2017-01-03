//
//  ShopDetailsView.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsView.h"

@implementation ShopDetailsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.table];
    }
    return self;
}

- (StarsView *)star{
    if (_star == nil) {
        _star = [[StarsView alloc] initWithStarSize:CGSizeMake(11, 11) space:5 numberOfStar:5];
        _star.frame = CGRectMake(0, 0, 71, 11);
        _star.score = 3.4;
    }
    return _star;
}

- (UITableView *)table{
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStyleGrouped];
        _table.backgroundColor = [UIColor redColor];
    }
    return _table;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self bringSubviewToFront:_backgroundView];
    _backgroundView.backgroundColor = [UIColor colorWithRed:0/250.0 green:0/250.0 blue:0/250.0 alpha:0.25];
    _starView.backgroundColor = [UIColor clearColor];
    [self.starView addSubview:self.star];
}

@end
