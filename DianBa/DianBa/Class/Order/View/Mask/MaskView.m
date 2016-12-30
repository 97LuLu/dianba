//
//  MaskView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/29.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.maskView];
    }
    return self;
}

- (UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [GVColor hexStringToColor:@"#000000"];
        _maskView.alpha = 0.5;
    }
    return _maskView;
}

@end
