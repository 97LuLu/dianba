//
//  OrderHeaderView.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImgView;
@property (strong, nonatomic) IBOutlet UIImageView *shopImg;
@property (strong, nonatomic) IBOutlet UILabel *shopName;
@property (strong, nonatomic) IBOutlet UILabel *shopBrief;
@property (strong, nonatomic) IBOutlet UIView *smallView;
@property (strong, nonatomic) IBOutlet UIButton *takeoutBtn;

@property (strong, nonatomic) IBOutlet UIButton *maskBtn;

@end
