//
//  CollectionViewCell.m
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(UIImageView *)imgView
{
    if(!_imgView)
    {
        _imgView = [[UIImageView  alloc]init];
        
    }
    return _imgView;
}
-(UILabel *)label
{
    if(!_label)
    {
        _label = [[UILabel  alloc]init];
        _label.font = [UIFont  systemFontOfSize:12];
    }
    return _label;
}

-(UILabel *)dealLabel
{
    if(!_dealLabel)
    {
        _dealLabel = [[UILabel  alloc]init];
        _dealLabel.font = [UIFont  systemFontOfSize:12];
        _label.numberOfLines = 0;
    }
    return _dealLabel;
}
-(UILabel *)distanceLabel
{
    if(!_distanceLabel)
    {
        _distanceLabel = [[UILabel  alloc]init];
        _distanceLabel.font = [UIFont  systemFontOfSize:12];
    }
    return _distanceLabel;
}
-(UIView *)starM
{
  if(!_starM)
  {
      _starM = [[UIView  alloc]init];
  }
    return _starM;
}
-(UIImageView *)menImg
{
  if(!_menImg)
  {
      _menImg = [[UIImageView  alloc]init];
      _menImg.image = [UIImage imageNamed:@"tag"];
    [self.imgView  addSubview:_menImg];
  }
    return _menImg;
}
-(UILabel *)menLabel
{
   if(!_menLabel)
   {
       _menLabel = [[UILabel  alloc]init];
       _menLabel.font = [UIFont systemFontOfSize:12];
       _menLabel.textAlignment = NSTextAlignmentCenter;
        [self.menImg  addSubview:_menLabel];
   }
    return _menLabel;
}
-(UIImageView *)takeImg
{
   if(!_takeImg)
   {
       _takeImg = [[UIImageView  alloc]init];
   }
    return _takeImg;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self.contentView  addSubview:self.imgView];
        
        [self.contentView  addSubview:self.label];
        [self.contentView  addSubview:self.dealLabel];
        [self.contentView  addSubview:self.distanceLabel];
        [self.contentView  addSubview:self.takeImg];
        [self.contentView  addSubview:self.starM];
    
    }
    return self;
}

-(void)layoutSubviews
{
    [super  layoutSubviews];
    
    [self.imgView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(0);
        make.left.mas_equalTo(self.contentView).offset(0);
        make.right.mas_equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(110);
        
    }];
    
    [self.label  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).offset(15);
        make.left.mas_equalTo(self.imgView.mas_left).offset(4);

    }];

    [self.takeImg  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.label.mas_top);
        make.left.mas_equalTo(self.label.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        
    }];
    
    [self.starM  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(7);
        make.left.mas_equalTo(self.label.mas_left);
        make.width.mas_offset(140);
        make.height.mas_equalTo(20);
    }];

    [self.dealLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.starM.mas_bottom).offset(12);
        make.left.mas_equalTo(self.imgView.mas_left);
        make.height.mas_equalTo(30);
        
    }];

    [self.distanceLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dealLabel.mas_top);
        make.right.mas_equalTo(self.imgView.mas_right).offset(-4);
        make.height.mas_equalTo(self.dealLabel.mas_height);
        
    }];
    [self.menImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_top).offset(5);
        make.right.mas_equalTo(self.imgView.mas_right);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(52);
    }];
    [self.menLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.menImg.mas_top).offset(1);
        make.right.mas_equalTo(self.menImg.mas_right);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(43);
    }];

}
-(void)setHotModel:(HomeModel_hot *)hotModel
{
    _hotModel = hotModel;
    
    self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:hotModel.store_photo]]];
    
    self.distanceLabel.text = hotModel.juli;
    self.dealLabel.text = [NSString  stringWithFormat:@"成交%@",hotModel.count] ;
    self.label.text = hotModel.store_name;
    self.menLabel.text = hotModel.menu_attr;
    self.starsV = [[WSStarRatingView  alloc]initWithFrame:CGRectMake(0, 0, 140, 20) numberOfStar:[hotModel.star  intValue]];
    
    [self.starM addSubview:self.starsV];
    
    if([hotModel.is_outsite isEqualToString:@"1"])
    {
        self.takeImg.image = [UIImage imageNamed:@"take_out"];
    }
    else
    {
        self.takeImg.image = [UIImage imageNamed:@""];
    }

}



@end
