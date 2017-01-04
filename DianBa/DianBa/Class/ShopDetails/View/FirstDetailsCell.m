//
//  FirstDetailsCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "FirstDetailsCell.h"

@implementation FirstDetailsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.firstLabel];
    }
    return self;
}

- (UILabel *)firstLabel{
    if (_firstLabel == nil) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.numberOfLines = 0;
        _firstLabel.textColor = [GVColor hexStringToColor:@"#888888"];
    }
    return _firstLabel;
}

@end
