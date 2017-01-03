//
//  CollectionViewCell.h
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "WSStarRatingView.h"
@interface CollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView  *imgView;;
@property(nonatomic,strong) UILabel    *dealLabel;
@property(nonatomic,strong) UILabel    *label;
@property(nonatomic,strong) UILabel    *distanceLabel;
@property(nonatomic,strong) UIView    *starM;
@property(nonatomic,strong) NSString  *starCollectionStr;
@property(nonatomic,strong) UIImageView *menImg;
@property(nonatomic,strong) UILabel     *menLabel;
@property(nonatomic,strong) UIImageView     *takeImg;//外买
@property(nonatomic,strong) HomeModel_hot  *hotModel;
@property(nonatomic,strong) WSStarRatingView *starsV;
@end
