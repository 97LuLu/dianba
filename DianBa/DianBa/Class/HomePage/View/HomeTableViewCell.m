//
//  HomeTableViewCell.m
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self  addSubview:self.imgView];
        [self  addSubview:self.titleLabel];
        [self  addSubview:self.scoreView];
        [self  addSubview:self.volumeLabel];
        [self  addSubview:self.cuisineLabel];
        [self  addSubview:self.distanceLabel];
        [self  addSubview:self.distanceLabel];
        [self  addSubview:self.takeImg];
        [self  addSubview:self.lineLabel];
    }
    return   self;
}

-(UIImageView *)imgView
{
    if(!_imgView)
    {
        _imgView = [[UIImageView  alloc]init];
    }
    return _imgView;
}
-(UIImageView *)takeImg
{
    if(!_takeImg)
    {
        _takeImg = [[UIImageView  alloc]init];

    }
    return _takeImg;
}

-(UILabel *)titleLabel
{
   if(!_titleLabel)
   {
       _titleLabel = [[UILabel  alloc]init];
       _titleLabel.font = [UIFont  systemFontOfSize:15];
       _titleLabel.textColor = [UIColor  blackColor];
   }
    return _titleLabel;
}
-(UILabel *)volumeLabel
{
    if(!_volumeLabel)
    {
        _volumeLabel = [[UILabel  alloc]init];
        _volumeLabel.font = [UIFont  systemFontOfSize:15];
        _volumeLabel.textColor = [UIColor  blackColor];
    }
    return _volumeLabel;
}
-(UILabel *)distanceLabel
{
    if(!_distanceLabel)
    {
        _distanceLabel = [[UILabel  alloc]init];
        _distanceLabel.font = [UIFont  systemFontOfSize:15];
        _distanceLabel.textColor = [UIColor  blackColor];
    }
    return _distanceLabel;
}
-(UILabel *)cuisineLabel
{
    if(!_cuisineLabel)
    {
        _cuisineLabel = [[UILabel  alloc]init];
        _cuisineLabel.font = [UIFont  systemFontOfSize:15];
        _cuisineLabel.textColor = [UIColor  blackColor];
    }
    return _cuisineLabel;
}
-(UILabel *)lineLabel
{
    if(!_lineLabel)
    {
        _lineLabel = [[UILabel  alloc]init];
        _lineLabel.textColor = [UIColor  blackColor];
    }
    return _lineLabel;
}
-(UIView *)scoreView
{
   if(!_scoreView)
   {
       _scoreView = [[UIView  alloc]init];
   }
    return _scoreView;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(5);
        make.left.mas_equalTo(self).offset(12);
        make.size.mas_equalTo(CGSizeMake(88, 67));
    }];
    //店名
    [self.titleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);
        make.top.mas_equalTo(self.imgView.mas_top);
        make.height.mas_equalTo(18);
        
    }];
    //外卖图片
    [self.takeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(10);
        make.top.mas_equalTo(self.titleLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        
    }];
    //距离
    [self.distanceLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.titleLabel.mas_bottom);
        make.right.mas_equalTo(self).offset(-12);
        make.height.mas_equalTo(13);
        
    }];
    //评分等级
    [self.scoreView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);

        make.height.mas_equalTo(18);
        
    }];
    //成交量
    [self.volumeLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scoreView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);
        make.height.mas_equalTo(15);
        
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.volumeLabel.mas_top);
        make.left.mas_equalTo(self.volumeLabel.mas_right).offset(8);
        make.height.mas_equalTo(self.volumeLabel.mas_height);
    }];
    [self.cuisineLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.volumeLabel.mas_top);
        make.left.mas_equalTo(self.lineLabel.mas_right).offset(8);
        make.height.mas_equalTo(self.volumeLabel.mas_height);
    }];
}
-(void)setInfoModel:(HomeModel_info *)infoModel
{
    _infoModel = infoModel;
    
    self.imgView.image = [UIImage imageWithData:[NSData  dataWithContentsOfURL:[NSURL URLWithString:infoModel.store_photo]]];
    
    self.titleLabel.text = infoModel.store_name;
    self.distanceLabel.text = infoModel.juli;
    self.volumeLabel.text = [NSString stringWithFormat:@" 成交%@",infoModel.count];
    self.cuisineLabel.text = infoModel.menu_attr;
    
    self.starsV = [[WSStarRatingView  alloc]initWithFrame:CGRectMake(0, 0, 140, 20) numberOfStar:[infoModel.star  intValue]];
    [self.scoreView   addSubview:self.starsV];
    
    if([infoModel.is_outsite isEqualToString:@"1"])
    {
        self.takeImg.image = [UIImage imageNamed:@"take_out"];
    }
    else
    {
        self.takeImg.image = [UIImage imageNamed:@""];
    }

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
