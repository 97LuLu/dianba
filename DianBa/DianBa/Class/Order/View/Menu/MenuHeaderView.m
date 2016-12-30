//
//  MenuHeaderView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/29.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "MenuHeaderView.h"

@implementation MenuHeaderView

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self.headerBtn setImage:[UIImage imageWithOriginaName:@"seek"] forState:UIControlStateNormal];
    [self.headerBtn setTitle:@"请输入..." forState:UIControlStateNormal];
    self.headerBtn.imageEdgeInsets = UIEdgeInsetsMake(2, -40, 0, 60);
    self.headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -80, 0, 0);
    [self.headerBtn setTitleColor:[GVColor hexStringToColor:@"#cccccc"] forState:UIControlStateNormal];
    self.headerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.headerBtn.layer.masksToBounds = YES;
    self.headerBtn.layer.cornerRadius = 12.5;
    self.headerBtn.layer.borderWidth = 0.5;
    
    self.headerBtn.layer.borderColor = [GVColor hexStringToColor:@"#aaaaaa"].CGColor;
    
}

@end
