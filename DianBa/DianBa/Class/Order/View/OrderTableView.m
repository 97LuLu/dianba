//
//  OrderTableView.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderTableView.h"

@implementation OrderTableView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.ordertable];
    }
    
    return self;
}

-(UITableView *)ordertable{
    
    if (_ordertable == nil) {
        self.ordertable = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.bounds.size.width, self.bounds.size.height + 20) style:UITableViewStyleGrouped];
    }
    
    return _ordertable;
}

@end
