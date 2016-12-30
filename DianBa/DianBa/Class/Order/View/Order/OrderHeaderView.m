//
//  OrderHeaderView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年wangchenlu. All rights reserved.
//

#import "OrderHeaderView.h"
#import "UIImage+ImageEffects.h"

@implementation OrderHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.shopImg.layer.masksToBounds = YES;
    self.shopImg.layer.cornerRadius = 59 / 2;
    self.backgroundImgView.image = self.shopImg.image;
    [self.backgroundImgView.image blurImageWithRadius:0.5];
    
}

@end
