//
//  HomeView.m
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomeView.h"

#define W self.frame.size.width
#define H  self.frame.size.height

@implementation HomeView


-(UICollectionView *)headerCollection
{
    if(!_headerCollection)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout  alloc]init];
        flowLayout.itemSize = CGSizeMake(150, 212);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 12, 0, -12);
        _headerCollection = [[UICollectionView  alloc]initWithFrame:CGRectMake(0, 214, self.frame.size.width, 212) collectionViewLayout:flowLayout];
        
        flowLayout.minimumLineSpacing = 12;//行间距
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _headerCollection.backgroundColor = [UIColor  colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1];
    }
    return _headerCollection;
}
-(UIScrollView *)headerScroll
{
    if(!_headerScroll)
    {
        _headerScroll  = [[ UIScrollView  alloc]init];
        _headerScroll.pagingEnabled = YES;
        _headerScroll.showsVerticalScrollIndicator = YES;
        _headerScroll.bounces = NO;
        _headerScroll.backgroundColor = [UIColor  greenColor];
    }
    return _headerScroll;
}
-(UILabel *)lineLabel1
{
    if(!_lineLabel1)
    {
        _lineLabel1 = [[UILabel  alloc]init];
        _lineLabel1.backgroundColor = [UIColor  lightGrayColor];

    }
    return _lineLabel1;
}
-(UILabel *)lineLabel2
{
    if(!_lineLabel2)
    {
        _lineLabel2 = [[UILabel  alloc]init];
        _lineLabel2.backgroundColor = [UIColor  lightGrayColor];

    }
    return _lineLabel2;
}
-(UILabel *)contentLabel
{
    if(!_contentLabel)
    {
        _contentLabel  = [[UILabel  alloc]init];
        _contentLabel.text = @"热门推荐";
        _contentLabel.font = [UIFont  systemFontOfSize:20];
        _contentLabel.textAlignment = NSTextAlignmentCenter;

    }
    return _contentLabel;
}
-(UILabel *)leftLabel
{
  if(!_leftLabel)
  {
      _leftLabel = [[UILabel  alloc]init];
      _leftLabel.backgroundColor = [UIColor lightGrayColor];
  }
    return _leftLabel;
}
-(UILabel *)middlelLabel
{
    if(!_middlelLabel)
    {
        
        _middlelLabel = [[UILabel  alloc]init];
        _middlelLabel.text = @"附近餐馆";
        _middlelLabel.textAlignment = NSTextAlignmentCenter;
        _middlelLabel.font = [UIFont  systemFontOfSize:18];
    }
    return _middlelLabel;
}
-(UILabel *)rightLabel
{
    if(!_rightLabel)
    {
        
        _rightLabel = [[UILabel  alloc]init];
        _rightLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _rightLabel;
}
-(UIButton *)leftBtn
{
    if(!_leftBtn)
    {
        _leftBtn = [[UIButton  alloc]init];
        [_leftBtn  setTitle:@"全部" forState:UIControlStateNormal];
        [_leftBtn  setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal];
        [_leftBtn  setTitleColor:[UIColor  lightGrayColor] forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont  systemFontOfSize:14];
        [_leftBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
        [_leftBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [_leftBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
    }
    return _leftBtn;
}
-(UILabel *)dLeftLabel
{
    if(!_dLeftLabel)
    {
        _dLeftLabel = [[UILabel  alloc]init];
        _dLeftLabel.backgroundColor = [UIColor redColor];
    }
    return _dLeftLabel;
}

-(UIButton *)middleBtn
{
    if(!_middleBtn)
    {
        //中间按钮
        _middleBtn = [[UIButton  alloc]init];
        [_middleBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
        [_middleBtn  setTitle:@"附近" forState:UIControlStateNormal];
        [_middleBtn  setTitleColor:[UIColor  lightGrayColor] forState:UIControlStateNormal];
        _middleBtn.titleLabel.font = [UIFont  systemFontOfSize:14];
        [_middleBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [_middleBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
        [_middleBtn  setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal];
    }
    return _middleBtn;
}
-(UILabel *)dRightLabel
{
    if(!_dRightLabel)
    {
        _dRightLabel = [[UILabel  alloc]init];
        _dRightLabel.backgroundColor = [UIColor redColor];
    }
    return _dRightLabel;
}

-(UIButton *)rightBtn
{
    if(!_rightBtn)
    {
        //右边按钮
        _rightBtn = [[UIButton  alloc]init];
        [_rightBtn  setTitle:@"综合排序" forState:UIControlStateNormal];
        [_rightBtn  setTitleColor:[UIColor  lightGrayColor] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont  systemFontOfSize:14];
        [_rightBtn  setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
        [_rightBtn  setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal];
        [_rightBtn  setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [_rightBtn  setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
 
    }
    return _rightBtn;
}

//布局
-(void)layoutSubviews
{
    
    [self.headerScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(0);
        make.left.mas_equalTo(self).offset(0);
        make.right.mas_equalTo(self).offset(0);
        make.width.mas_equalTo(W);
        make.height.mas_equalTo(150);
    }];

    [self.lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerScroll.mas_bottom).offset(28);
        make.left.mas_equalTo(self).offset(12);
        make.width.mas_equalTo(118);
        make.height.mas_equalTo(1);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerScroll.mas_bottom).offset(18);
        make.left.mas_equalTo(self.lineLabel1.mas_right).offset(16);
        make.right.mas_equalTo(self.lineLabel2.mas_left).offset(16);
        make.height.mas_equalTo(20);
    }];
    [self.lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerScroll.mas_bottom).offset(28);
        make.right.mas_equalTo(self).offset(-12);
        make.width.mas_equalTo(118);
        make.height.mas_equalTo(1);
    }];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerCollection.mas_bottom).offset(39);
        make.left.mas_equalTo(self).offset(12);
        make.width.mas_equalTo(118);
        make.height.mas_equalTo(1);
        
    }];

    [self.middlelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerCollection.mas_bottom).offset(30);
        make.left.mas_equalTo(self.leftLabel.mas_right).offset(16);
        make.right.mas_equalTo(self.rightLabel.mas_left).offset(-12);
        make.height.mas_equalTo(20);
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftLabel.mas_top);
        make.right.mas_equalTo(self).offset(-12);
        make.width.mas_equalTo(118);
        make.height.mas_equalTo(1);
        
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middlelLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self).offset(15);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(20);
        
    }];
    
    [self.dLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middlelLabel.mas_bottom).offset(30);
        make.left.mas_equalTo(self.leftBtn.mas_right).offset(0);
        make.width.mas_equalTo(102);
        make.height.mas_equalTo(1);
        
    }];
    
    [self.middleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middlelLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.dLeftLabel.mas_right).offset(0);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(20);
        
    }];
    [self.dRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middlelLabel.mas_bottom).offset(30);
        make.left.mas_equalTo(self.middleBtn.mas_right).offset(0);
        make.width.mas_equalTo(77);
        make.height.mas_equalTo(1);
        
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middlelLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.dRightLabel.mas_right).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(110);
    }];

    
}
//重写控件并添加
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self  addSubview:self.headerScroll];
        [self  addSubview:self.lineLabel1];
        [self  addSubview:self.lineLabel2];
        [self  addSubview:self.contentLabel];
        [self  addSubview:self.headerCollection];
        [self  addSubview:self.leftLabel];
        [self  addSubview:self.middlelLabel];
        [self  addSubview:self.rightLabel];
        [self  addSubview:self.leftBtn];
        [self  addSubview:self.dLeftLabel];
        [self  addSubview:self.middleBtn];
        [self  addSubview:self.dRightLabel];
        [self  addSubview:self.rightBtn];
        
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
