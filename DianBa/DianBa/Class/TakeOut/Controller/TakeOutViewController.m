//
//  TakeOutViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "TakeOutViewController.h"
#import "TakeView.h"
#import "HomeTableViewCell.h"

@interface TakeOutViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    TakeView  *takeView;
}

@end

@implementation TakeOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    takeView = [[TakeView  alloc]initWithFrame:self.view.frame];
    takeView.taleTable.delegate = self;
    takeView.taleTable.dataSource = self;
    [self.view  addSubview:takeView];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *takeC = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:takeC];
    if(!cell)
    {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:takeC];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
