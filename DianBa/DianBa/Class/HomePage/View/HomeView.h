//
//  HomeView.h
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"


@interface HomeView : UIView

@property(nonatomic,strong) UIScrollView     *headerScroll;
@property(nonatomic,strong) UICollectionView *headerCollection;
@property(nonatomic,strong) UILabel          *lineLabel1,*lineLabel2,*contentLabel;

@property(nonatomic,strong) UILabel    *leftLabel;
@property(nonatomic,strong) UILabel    *middlelLabel;
@property(nonatomic,strong) UILabel    *rightLabel;
@property(nonatomic,strong) UILabel    *dLeftLabel;
@property(nonatomic,strong) UILabel    *dRightLabel;
@property(nonatomic,strong) UIButton   *leftBtn,*middleBtn,*rightBtn;


@end
