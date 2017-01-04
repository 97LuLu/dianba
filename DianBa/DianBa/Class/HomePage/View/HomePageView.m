//
//  HomePageView.m
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomePageView.h"

@implementation HomePageView

//初始化
-(UITableView *)homeTableView
{
    if(!_homeTableView)
    {
    _homeTableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];

//        _homeTableView.backgroundColor = [UIColor  purpleColor];
        
    }
    return _homeTableView;
}
//重写控件并添加
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
      
        [self  addSubview:self.homeTableView];
        
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
