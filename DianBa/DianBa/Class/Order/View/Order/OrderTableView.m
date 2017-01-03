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
        [self addSubview:self.rowingBtn];
        [self addSubview:self.carView];
        [self addSubview:self.navigationView];
        [self.navigationView addSubview:self.nReturnBtn];
        [self.navigationView addSubview:self.nCollectionBtn];
        [self.navigationView addSubview:self.titleLabel];
        [self.carView addSubview:self.carBtn];
        [self.carBtn addSubview:self.badgeLabel];
        [self.carView addSubview:self.rMBLabel];
        [self.carView addSubview:self.priceLabel];
        [self.carView addSubview:self.balanceBtn];
        
    }
    
    return self;
}

#pragma mark - 初始化

- (UIView *)carView{
    if (_carView == nil) {
        _carView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 40, ScreenWidth, 40)];
        _carView.backgroundColor = [GVColor hexStringToColor:@"#666666"];
    }
    return _carView;
}
- (UIButton *)carBtn{
    if (_carBtn == nil) {
        _carBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, -20, 60, 60)];
        [_carBtn setImage:[UIImage imageWithOriginaName:@"shopping_cart"] forState:UIControlStateNormal];
    }
    return _carBtn;
}
-(UILabel *)badgeLabel{
    if (_badgeLabel == nil) {
        _badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(41, 7, 16, 16)];
        _badgeLabel.layer.masksToBounds = YES;
        _badgeLabel.layer.cornerRadius = 8;
        _badgeLabel.backgroundColor = [GVColor hexStringToColor:@"#DB3F24"];
        _badgeLabel.font = [UIFont systemFontOfSize:11];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
        _badgeLabel.text = @"1";
        _badgeLabel.hidden = YES;
    }
    return _badgeLabel;
}
-(UILabel *)rMBLabel{
    if (_rMBLabel == nil) {
        _rMBLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 16, 20)];
        _rMBLabel.textColor = [GVColor hexStringToColor:@"#b3b3b3"];
        _rMBLabel.font = [UIFont systemFontOfSize:14];
        _rMBLabel.textAlignment = NSTextAlignmentCenter;
        _rMBLabel.text = @"￥";
    }
    return _rMBLabel;
}
-(UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(99, 10, 100, 20)];
        _priceLabel.textColor = [GVColor hexStringToColor:@"#b3b3b3"];
        _priceLabel.font = [UIFont systemFontOfSize:17];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.text = @"0";
    }
    return _priceLabel;
}
- (UIButton *)balanceBtn{
    if (_balanceBtn == nil) {
        _balanceBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 80, 0, 80, 40)];
        _balanceBtn.backgroundColor = [GVColor hexStringToColor:@"#7f7f7f"];
        [_balanceBtn setTitle:@"结算" forState:UIControlStateNormal];
        [_balanceBtn setTitleColor:[GVColor hexStringToColor:@"#e6e6e6"] forState:UIControlStateNormal];
        _balanceBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _balanceBtn;
}

-(UITableView *)ordertable{
    
    if (_ordertable == nil) {
        self.ordertable = [[UITableView alloc] initWithFrame:CGRectMake(StartX, -20, self.bounds.size.width, self.bounds.size.height - 20) style:UITableViewStylePlain];
        self.ordertable.tag = 1;
    }
    
    return _ordertable;
}

- (UITableView *)hotPotTable{
    
    if (_hotPotTable == nil) {
        self.hotPotTable = [[UITableView alloc] initWithFrame:CGRectMake(StartX, 64, 235, ScreenHeight) style:UITableViewStylePlain];
        self.hotPotTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"peking"]];
        self.hotPotTable.tag = 2;
    }
    
    return _hotPotTable;
}

- (UIButton *)rowingBtn{
    
    if (_rowingBtn == nil) {
        self.rowingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rowingBtn.frame = CGRectMake(StartX, 378, 26, 80);
        [self.rowingBtn setImage:[UIImage imageNamed:@"rowing_to_starboard"] forState:UIControlStateNormal];
    }
    
    return _rowingBtn;
}

-(UIButton *)returnBtn{
    
    if (_returnBtn == nil) {
        
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _returnBtn.frame = CGRectMake(12, 34, 11, 16);
        [_returnBtn setImage:[UIImage imageNamed:@"the-arrow-"] forState:UIControlStateNormal];
    }
    
    return _returnBtn;
}

- (UIButton *)collectionBtn{
    
    if (_collectionBtn == nil) {
       _collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _collectionBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30, 34, 18, 17);
        [_collectionBtn setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal];
    }
    
    return _collectionBtn;
}

- (UIView *)navigationView{
    if (_navigationView == nil) {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
        _navigationView.backgroundColor = [UIColor colorWithRed:253/250.0 green:173/250.0 blue:19/250.0 alpha:1.0];
        _navigationView.hidden = YES;
    }
    return _navigationView;
}

-(UIButton *)nReturnBtn{
    
    if (_nReturnBtn == nil) {
        
        _nReturnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nReturnBtn.frame = CGRectMake(12, 34, 11, 16);
        [_nReturnBtn setImage:[UIImage imageNamed:@"the-arrow-"] forState:UIControlStateNormal];
    }
    
    return _nReturnBtn;
}

- (UIButton *)nCollectionBtn{
    
    if (_nCollectionBtn == nil) {
        _nCollectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nCollectionBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30, 34, 18, 17);
        [_nCollectionBtn setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal];
    }
    
    return _nCollectionBtn;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 34, ScreenWidth - 200, 20)];
        _titleLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
        _titleLabel.font = [UIFont systemFontOfSize:19];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}

@end
