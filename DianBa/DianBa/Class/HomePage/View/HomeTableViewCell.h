//
//  HomeTableViewCell.h
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "WSStarRatingView.h"

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView  *imgView;
@property(nonatomic,strong) UILabel      *titleLabel;//店名
@property(nonatomic,strong) UILabel      *volumeLabel;//成交量
@property(nonatomic,strong) UILabel      *cuisineLabel;//菜系
@property(nonatomic,strong) UILabel      *distanceLabel;//距离
@property(nonatomic,strong) UIImageView     *takeImg;//外买
@property(nonatomic,strong) UIView       *scoreView;//评分
@property(nonatomic,strong) UILabel      *lineLabel;
@property(nonatomic,strong) HomeModel_info  *infoModel;
@property(nonatomic,assign) NSString    *star;
@property(nonatomic,strong) WSStarRatingView *starsV;

@end
