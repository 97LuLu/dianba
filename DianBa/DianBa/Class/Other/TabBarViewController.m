//
//  TabBarViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomePageViewController.h"
#import "TakeOutViewController.h"
#import "OrderFormViewController.h"
#import "MineViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

+(void)initialize{
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1.00];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.99 green:0.68 blue:0.00 alpha:1.00];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setupChildViewController:[[HomePageViewController alloc] init]
                             title:@"首页"
                             image:@"home_press"
                     selectedImage:@"home_up"];
    [self setupChildViewController:[[TakeOutViewController alloc] init]
                             title:@"外卖"
                             image:@"take_down"
                     selectedImage:@"take_up"];
    [self setupChildViewController:[[OrderFormViewController alloc] init]
                             title:@"订单"
                             image:@"indent_down"
                     selectedImage:@"indent_up"];
    [self setupChildViewController:[[MineViewController alloc] init]
                             title:@"我的"
                             image:@"mine_down"
                     selectedImage:@"mine_up"];
}
- (void)setupChildViewController:(UIViewController *)childController
                           title:(NSString *)title
                           image:(NSString *)image
                   selectedImage:(NSString *)selectedImage {

    childController.title = title;
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];

    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:childController];
    navCon.title = title;
    [self addChildViewController:navCon];
}


@end
