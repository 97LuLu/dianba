//
//  HomePageViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomePageViewController.h"
#import "DQHotSearchViewController.h"
#import "popUpView.h"
#import "NavgationView.h"
#import "CityList.h"
#import <AVFoundation/AVFoundation.h>
#import "scanQRViewController.h"

@interface HomePageViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    UIButton *button;
}

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) NavgationView * navgationView;
@property (nonatomic, strong) popUpView * popUp;
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navgationView.hidden = NO;
    self.popUp.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navgationView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:self.navgationView];
    
    [self.view addSubview:self.popUp];
    [self.view addGestureRecognizer:self.tapGesture];
    
    
}

- (UITapGestureRecognizer *)tapGesture{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesterClick:)];
    }
    return _tapGesture;
}

- (void)tapGesterClick:(UITapGestureRecognizer *)tap{
    self.popUp.hidden = YES;
}

-  (NavgationView *)navgationView{
    if (!_navgationView) {
        _navgationView = [[[NSBundle mainBundle] loadNibNamed:@"NavgationView" owner:self options:nil] lastObject];
        _navgationView.frame = CGRectMake(0, 0, ScreenWidth, 40);
        
        //
        [_navgationView.cityButton addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_navgationView.searchButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [_navgationView.addButton addTarget:self action:@selector(addButtonCilck) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _navgationView;
}



- (void)cityButtonClick:(UIButton *)but{
   
    CityList *cvc = [[CityList alloc]init];
    cvc.hidesBottomBarWhenPushed = YES;
    cvc.selectCity = ^(NSString *cityName){
        but.titleLabel.text = [NSString stringWithFormat:@"%@",cityName];
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)selectButton:(UIButton *)but{
     [self.navigationController pushViewController:[DQHotSearchViewController new] animated:YES];
}


- (void)addButtonCilck{
    self.popUp.hidden = !self.popUp.hidden;
}

- (popUpView *)popUp{
    if (!_popUp) {
        _popUp = [[[NSBundle mainBundle] loadNibNamed:@"popUpView" owner:self options:nil] lastObject];
        _popUp.frame = CGRectMake(243, 64, 120, 140);
        [_popUp.sweepQrButton addTarget:self action:@selector(sweepQrButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_popUp.paymentQrButton addTarget:self action:@selector(paymentQrButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_popUp.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popUp;
}
/**
 扫一扫的方法
 */
- (IBAction)sweepQrButtonClick:(id)sender {
    NSLog(@"11111");
    scanQRViewController *scanQr = [[scanQRViewController alloc] init];
    [self.navigationController pushViewController:scanQr animated:YES];
}


/**
 付款码的方法
 */
- (IBAction)paymentQrButtonClick:(id)sender {
     NSLog(@"22222");
}


/**
 登录的方法
 */
- (IBAction)loginButtonClick:(id)sender {
     NSLog(@"3333");
}

@end
