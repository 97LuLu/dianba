//
//  TakeView.m
//  DianBa
//
//  Created by Apple on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "TakeView.h"

@implementation TakeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self  addSubview:self.taleTable];
        [self  addSubview:self.takePopView];
    }
    return self;
}
-(UITableView *)taleTable
{
   if(!_taleTable)
   {
       _taleTable = [[UITableView  alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
   }
    return _taleTable;
}
-(UIView *)takePopView
{
   if(!_takePopView)
   {
       _takePopView = [[UIView  alloc]initWithFrame:CGRectMake(StartX, 64, ScreenWidth, 40)];
   }
    return _takePopView;
}
-(UIButton *)totalBtn
{
  if(!_totalBtn)
  {
      _totalBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
      [_totalBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
      [_totalBtn  setTitle:@"全部" forState:UIControlStateNormal];
      [_totalBtn  setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [_totalBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)];
      [_totalBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
      [self.takePopView addSubview:_totalBtn];
  }
    return _totalBtn;
}
-(UIButton *)nearbyBtn
{
    if(!_nearbyBtn)
    {
        _nearbyBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_nearbyBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
        [_nearbyBtn  setTitle:@"附近" forState:UIControlStateNormal];
        [_nearbyBtn  setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_nearbyBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)];
        [_nearbyBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [self.takePopView addSubview:_nearbyBtn];
    }
    return _nearbyBtn;
}
-(UIButton *)synBtn
{
    if(!_synBtn)
    {
        _synBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
        [_synBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
        [_synBtn  setTitle:@"综合排序" forState:UIControlStateNormal];
        [_synBtn  setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_synBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
        [_synBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [self.takePopView addSubview:_synBtn];
    }
    return _synBtn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //全部
    [self.totalBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.takePopView.mas_top).offset(3);
        make.left.mas_equalTo(self.takePopView.mas_left).offset(10);
        make.width.mas_equalTo(90);
    }];
    //附近
    [self.nearbyBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.totalBtn.mas_top);
        make.left.mas_equalTo(self.totalBtn.mas_right).offset(50);
        make.width.mas_equalTo(90);
    }];
    //综合排序
    [self.synBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.totalBtn.mas_top);
        make.left.mas_equalTo(self.nearbyBtn.mas_right).offset(50);
        make.width.mas_equalTo(120);

    }];

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
