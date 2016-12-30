//
//  OrderTableViewCell.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/30.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^number)(NSInteger number);
typedef void(^clickCar)(UIImageView *dropImage);

@interface OrderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *shopImg;
@property (strong, nonatomic) IBOutlet UILabel *dishesName;
@property (strong, nonatomic) IBOutlet UILabel *salesLabel;
@property (strong, nonatomic) IBOutlet UILabel *praiseLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (strong, nonatomic) IBOutlet UIButton *subtractBtn;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;

/*------------------- 购物车 ----------------*/
@property (strong, nonatomic) IBOutlet UIImageView *dropImageView;
@property  (nonatomic , strong) clickCar clickCars;

/*------------------ 传值 ------------------*/
@property (nonatomic, strong) number number;

@end
