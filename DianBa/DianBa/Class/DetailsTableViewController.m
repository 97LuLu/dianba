//
//  DetailsTableViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/2.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "FoodEvaluateTableViewCell.h"
#import <Masonry/Masonry.h>

@interface DetailsTableViewController ()



@end

@implementation DetailsTableViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏导航
//    [self.navigationController.navigationBar setAlpha:0.1];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.view addSubview:self.headerImage];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.tableView.contentInset =UIEdgeInsetsMake(-20, 0, 0, 0);
    self.tableView.tableHeaderView = self.headView;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    [self backButton];
    [self shoppingCartButton];
}


#pragma mark -- UITableViewDelegate／UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

        return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *indentify = @"indentify";
        FoodEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodEvaluateTableViewCell" owner:self options:nil] lastObject];
        }
    
    return cell;
}

//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 30;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 40;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.
//}



- (UIButton *)shoppingCartButton{
    if (!_shoppingCartButton) {
        _shoppingCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_shoppingCartButton];
        [self.view bringSubviewToFront:_shoppingCartButton];
        _shoppingCartButton.frame = CGRectMake(ScreenWidth - 40, 28, 28, 28);
        _shoppingCartButton.layer.masksToBounds = YES;
        _shoppingCartButton.layer.cornerRadius = 14;
        //        _backButton.frame = CGRectMake(0, 0, 28, 28);
        _shoppingCartButton.alpha = 0.7;
        _shoppingCartButton.backgroundColor =[UIColor blackColor];
        [_shoppingCartButton setImage:[UIImage imageNamed:@"shopping-1"] forState:UIControlStateNormal];
    }
    return _shoppingCartButton;
}
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_backButton];
        [self.view bringSubviewToFront:_backButton];
        _backButton.frame = CGRectMake(12, 28, 28, 28);
        _backButton.layer.masksToBounds = YES;
        _backButton.layer.cornerRadius = 14;
//        _backButton.frame = CGRectMake(0, 0, 28, 28);
        _backButton.alpha = 0.7;
        _backButton.backgroundColor =[UIColor blackColor];
        [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_backButton setImage:[UIImage imageNamed:@"the-arrow-"] forState:UIControlStateNormal];
//        _backButton.sd_layout.topSpaceToView(self.tableView,28).leftSpaceToView(self.headView,12).widthIs(28).heightIs(28);
    }
    return _backButton;
}
//返回按钮的绑定
- (void)backButtonClick:(UIButton *)but{
    //返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 特色说明内容
-(UILabel *)FeaturesTextLabel{
    if (!_FeaturesTextLabel) {
        _FeaturesTextLabel = [[UILabel alloc] init];
        [self.headView addSubview:_FeaturesTextLabel];
        _FeaturesTextLabel.text = @"红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮子头红烧狮";
        _FeaturesTextLabel.numberOfLines = 0;
        _FeaturesTextLabel.textColor = [GVColor hexStringToColor:@"#333333"];
        _FeaturesTextLabel.font = [UIFont systemFontOfSize:16];
        _FeaturesTextLabel.sd_layout.topSpaceToView(self.FeaturesLabel,13).leftSpaceToView(self.headView,12).rightSpaceToView(self.headView,12).bottomSpaceToView(self.headView,15);
    }
    return _FeaturesTextLabel;
}

#pragma mark -- 特色说明
- (UILabel *)FeaturesLabel{
    if (!_FeaturesLabel) {
        _FeaturesLabel = [[UILabel alloc] init];
        [self.headView addSubview:_FeaturesLabel];
        _FeaturesLabel.text = @"特色说明";
        _FeaturesLabel.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
        _FeaturesLabel.sd_layout.topSpaceToView(self.label,16).leftSpaceToView(self.headView,12).widthIs(80).autoHeightRatio(0);
    }
    return _FeaturesLabel;
}

#pragma mark -- 分割线
- (UILabel *)label{
    if (!_label) {
        _label =[[UILabel alloc] init];
        [self.headView addSubview :_label];
        _label.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        _label.sd_layout.topSpaceToView(self.priceLabel,22).leftSpaceToView(self.headView,12).rightSpaceToView(self.headView,12).heightIs(1);
    }
    return _label;
}

#pragma mark -- 添加按钮
- (UIButton *)addButton{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headView addSubview:self.addButton];
        _addButton.sd_layout.topSpaceToView(self.headerImage,15).rightSpaceToView(self.headView,12).widthIs(20).heightIs(20);
        [_addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    }
    return _addButton;
}
#pragma mark -- 价格
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        [self.headView addSubview:_priceLabel];
        
        //富文本
        NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%d",48]];
        //这里可以用加s的方法, 用字典参数进行多种设置
        
        [aAttributedString addAttribute:NSFontAttributeName
                                  value:[UIFont systemFontOfSize:15]
                                  range:NSMakeRange(0, 1)];
        
        [aAttributedString addAttribute:NSFontAttributeName
                                  value:[UIFont systemFontOfSize:20]
                                  range:NSMakeRange(1, 2)];
        
        _priceLabel.attributedText = aAttributedString;
        _priceLabel.textColor = [GVColor hexStringToColor:@"#a4562f"];
        _priceLabel.sd_layout.topSpaceToView(self.salesLabel,15).leftSpaceToView(self.headView,17).widthIs(100);
        _priceLabel.sd_layout.autoHeightRatio(0);
    }
    return _priceLabel;
}

#pragma mark -- 菜品销量
- (UILabel *)salesLabel{
    if (!_salesLabel) {
        _salesLabel = [[UILabel alloc] init];
        [self.headView addSubview:_salesLabel];
        _salesLabel.text = [NSString stringWithFormat:@"月销 %d 份",100];
        _salesLabel.textColor = [GVColor hexStringToColor:@"#333333"];
        _salesLabel.sd_layout.topSpaceToView(self.nameLabel,12).leftSpaceToView(self.headView,12).widthIs(200).heightIs(20);
    }
    return _salesLabel;
}

#pragma mark -- 菜品名称
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self.headView addSubview:_nameLabel];
        _nameLabel.text = @"红烧狮子头";
        _nameLabel.font = [UIFont systemFontOfSize:19 weight:1];
        _nameLabel.textColor = [GVColor hexStringToColor:@"#333333"];
        _nameLabel.sd_layout.topSpaceToView(self.headerImage,12).leftSpaceToView(self.headView,12).widthIs(150);
        _nameLabel.sd_layout.autoHeightRatio(0);
    }
    return _nameLabel;
}

#pragma mark -- 头视图图片
- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc] init];
        [self.headView addSubview:_headerImage];
        [_headerImage setImage:[UIImage imageNamed:@"kkkkkkkk"]];
        _headerImage.backgroundColor = [UIColor blackColor];
        _headerImage.sd_layout.topSpaceToView(self.headView,0).leftSpaceToView(self.headView,0).rightSpaceToView(self.headView,0).heightIs(308);
    }
    return _headerImage;
}

#pragma mark -- 头视图
- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 580)];
        _headView.backgroundColor = [UIColor whiteColor];
        [self headerImage];
        [self nameLabel];
        [self salesLabel];
        [self priceLabel];
        [self addButton];
        [self label];
        [self FeaturesLabel];
        [self FeaturesTextLabel];
    }
    return _headView;
}



@end
