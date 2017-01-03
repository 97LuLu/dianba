//
//  NavgationView.m
//  DianBa
//
//  Created by Hunter on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "NavgationView.h"
#import "DQHotSearchViewController.h"
#import "HomePageViewController.h"
#import "CityList.h"

@implementation NavgationView{
    HomePageViewController * home;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    [_searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [_searchButton setTitle:@"输入商家、商圈" forState:UIControlStateNormal];
    _searchButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 60);
    _searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    [_searchButton setTitleColor:[UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00] forState:UIControlStateNormal];
    _searchButton.layer.masksToBounds = YES;
    _searchButton.layer.cornerRadius = 15;
    _searchButton.layer.borderColor = [[UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00] CGColor];
    _searchButton.layer.borderWidth = 0.5;
}



@end
