//
//  HomePageViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "SearchTableViewController.h"
#import "CityList.h"

@interface HomePageViewController (){
    UIButton *button;
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 100, 220, 35);
    button1.backgroundColor = [UIColor clearColor];
    //设置button正常状态下的图片
    [button1 setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
    button1.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 60);
    [button1 setTitle:@"输入商家、商圈" forState:UIControlStateNormal];
    //button标题的偏移量，这个偏移量是相对于图片的
    button1.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    //设置button正常状态下的标题颜色
    [button1 setTitleColor:[UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:18];
    //
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 20;
    button1.layer.borderColor = [[UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00] CGColor];
    button1.layer.borderWidth = 0.5;
    [button1 addTarget:self action:@selector(myButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    

    self.navigationItem.titleView = button1;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"more" imageEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)
        target:self
        action:@selector(addButton)];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0 , 0, 80, 50);
    button.backgroundColor = [UIColor clearColor];
    //设置button正常状态下的图片
    [button setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
    button.imageEdgeInsets = UIEdgeInsetsMake(10, 50, 10, -20);
    [button setTitle:@"城市" forState:UIControlStateNormal];
    //button标题的偏移量，这个偏移量是相对于图片的
    //上左下右
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    //设置button正常状态下的标题颜色
    [button setTitleColor:[UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.00] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

- (void)myButtonClick:(UIButton *)but{
    [self.navigationController pushViewController:[[SearchTableViewController alloc] init] animated:YES];
}

- (void)selectButton:(UIButton *)but{
    CityList *cvc = [[CityList alloc]init];
    cvc.hidesBottomBarWhenPushed = YES;
    cvc.selectCity = ^(NSString *cityName){
     but.titleLabel.text = [NSString stringWithFormat:@"%@",cityName];
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
}


- (void)addButton {

}
@end
