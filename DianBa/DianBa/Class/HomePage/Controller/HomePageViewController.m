//
//  HomePageViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomePageViewController.h"
#import "DQHotSearchViewController.h"
#import "NavgationView.h"
#import "CityList.h"


@interface HomePageViewController (){
    UIButton *button;
}
@property (nonatomic, assign) BOOL rightItemSelected;

@property (nonatomic, strong) NavgationView * navgationView;
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navgationView.hidden =
    NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navgationView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rightItemSelected = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:self.navgationView];
    
    [_navgationView.cityButton addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navgationView.searchButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [_navgationView.addButton addTarget:self action:@selector(addButtonCilck) forControlEvents:UIControlEventTouchUpInside];
}

-  (NavgationView *)navgationView{
    if (!_navgationView) {
        _navgationView = [[[NSBundle mainBundle] loadNibNamed:@"NavgationView" owner:self options:nil] lastObject];
        _navgationView.frame = CGRectMake(0, 0, ScreenWidth, 40);
        
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
  }
@end
