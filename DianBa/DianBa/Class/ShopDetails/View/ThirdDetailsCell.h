//
//  ThirdDetailsCell.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdDetailsCell : UITableViewCell

/** 头像 */
@property (strong, nonatomic) IBOutlet UIImageView *icon;
/** 昵称 */
@property (strong, nonatomic) IBOutlet UILabel *nickName;
/** 时间 */
@property (strong, nonatomic) IBOutlet UILabel *time;
/** 评论 */
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;


@end
