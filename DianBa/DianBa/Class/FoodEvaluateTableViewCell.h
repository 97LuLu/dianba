//
//  foodEvaluateTableViewCell.h
//  DianBa
//
//  Created by Hunter on 2016/12/31.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface foodEvaluateTableViewCell : UITableViewCell


/**
 头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *HeadPortrait;

/**
 名称
 */
@property (weak, nonatomic) IBOutlet UILabel *Name;

/**
 日期
 */
@property (weak, nonatomic) IBOutlet UILabel *Date;

/**
 简介
 */
@property (weak, nonatomic) IBOutlet UILabel *Evaluation;
@end
