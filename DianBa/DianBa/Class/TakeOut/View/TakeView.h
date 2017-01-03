//
//  TakeView.h
//  DianBa
//
//  Created by Apple on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeView : UIView
@property(nonatomic,strong) UITableView  *taleTable;
@property(nonatomic,strong) UIView       *takePopView;
@property(nonatomic,strong) UIButton  *totalBtn,*nearbyBtn,*synBtn;
@end
