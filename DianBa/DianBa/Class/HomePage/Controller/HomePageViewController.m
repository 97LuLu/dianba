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
#import "HomeView.h"
#import "CollectionViewCell.h"
#import "HomePageView.h"
#import "WSStarRatingView.h"
#import "PopoverView.h"
#import "HomeTableViewCell.h"
#import "OrderController.h"
#import "ffViewController.h"
#import "HomeRequest.h"
#import "HomeModel.h"

#define WIDTH  self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface HomePageViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
{
    UIButton *button;
    HomeView  *homeV;
    HomePageView  *homeP;

}
@property(nonatomic,strong)NSArray  *imgArray;//图片数组
@property(nonatomic,strong)UIPageControl  *pageControl;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic,strong) NSTimer *time;
@property (nonatomic,strong)  WSStarRatingView *starsV;
@property (nonatomic,assign) int  pageCount;
@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic,strong) NavgationView * navgationView;
@property (nonatomic,strong) popUpView * popUp;
@property (nonatomic,strong) NSMutableArray *collecArr;

@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navgationView.hidden = NO;
    self.popUp.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navgationView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"";

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:self.navgationView];
    
    //从导航栏下计算坐标
    self.navigationController.navigationBar.translucent=NO;
    homeP  = [[HomePageView  alloc]initWithFrame:self.view.frame];
    [self.view addSubview:homeP];

    [homeP addSubview:self.popUp];
    [self  setupAnalysis];
    [self   setupTable];//tableView
    
    homeP.homeTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self  setupAnalysis];//解析方法

    }];
    homeP.homeTableView.mj_footer = [MJRefreshFooter  footerWithRefreshingBlock:^{
        [self  setupAnalysis];//解析方法
 
        
    }];
}

#pragma mark---解析方法
-(void)setupAnalysis
{
    self.imgArray = [NSArray  array];
    self.dataSourceArr = [NSMutableArray  array];
    self.collecArr = [NSMutableArray  array];
    __weak typeof (self)weakSelf = self;
    [HomeRequest  PostWithListRequest:^(id imgArr, id infoArr, id hotArr) {
        
        weakSelf.imgArray = imgArr;
        weakSelf.dataSourceArr = hotArr;
        weakSelf.collecArr = infoArr;
        homeP.homeTableView.tableHeaderView = [self  setupheader];
        
        [homeP.homeTableView reloadData];
        [homeP.homeTableView.mj_header endRefreshing];
        [homeP.homeTableView.mj_footer endRefreshing];
        
    } failure:^(id error) {
        
        
    }];

}

#pragma mark--- tableView方法
-(void)setupTable
{
    homeP  = [[HomePageView  alloc]initWithFrame:self.view.frame];
    [self.view addSubview:homeP];
    homeP.homeTableView.delegate = self;
    homeP.homeTableView.dataSource = self;
    [homeP addSubview:self.popUp];
    homeP.homeTableView.tableHeaderView = [self  setupheader];
    homeP.homeTableView.tableHeaderView.userInteractionEnabled = YES;
    homeP.homeTableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.collecArr.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *st = @"yaou";
    HomeTableViewCell  *cell = [tableView  dequeueReusableCellWithIdentifier:st];
    if(!cell)
    {
        cell = [[HomeTableViewCell  alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:st];
        
    }
    [cell setInfoModel:self.collecArr[indexPath.item]] ;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrderController   *order = [[OrderController  alloc]init];
    
    [self.navigationController  pushViewController:order animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

#pragma mark---headerView
-(UIView*)setupheader
{
    homeV = [[HomeView  alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 530)];
    [homeV.leftBtn  addTarget:self action:@selector(chLeftClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [homeV.middleBtn  addTarget:self action:@selector(chMiddleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [homeV.rightBtn  addTarget:self action:@selector(chRightClick:) forControlEvents:UIControlEventTouchUpInside];
    [self  setupScroll];
    [self  setupCollection];

    return homeV;
}

-(void)popUp:(UIButton*)sender
{
    // 不带图片
    PopoverAction *action1 = [PopoverAction actionWithTitle:@"加好友" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    PopoverAction *action2 = [PopoverAction actionWithTitle:@"扫一扫" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    PopoverAction *action3 = [PopoverAction actionWithTitle:@"发起聊天" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    PopoverAction *action4 = [PopoverAction actionWithTitle:@"发起群聊" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    PopoverAction *action5 = [PopoverAction actionWithTitle:@"查找群聊" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    PopoverAction *action6 = [PopoverAction actionWithTitle:@"我的群聊" handler:^(PopoverAction *action) {
        //        _noticeLabel.text = action.title;
    }];
    
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.style = PopoverViewStyleDefault;
    popoverView.hideAfterTouchOutside = YES; // 点击外部时不允许隐藏
    [popoverView showToView:sender withActions:@[action1, action2, action3, action4, action5, action6]];
}

#pragma mark --- scroll方法
-(void)setupScroll
{
    
    homeV.headerScroll.delegate = self;
    if([self.imgArray  count]>0)
    {
        
        self.pageControl = [[UIPageControl  alloc]initWithFrame:CGRectMake(WIDTH-100, 120, 80, 44)];
        [homeV  addSubview:self.pageControl];
        // 设置总页数
        self.pageControl.numberOfPages = _imgArray.count;
        // 设置当前默认显示的页数
        self.pageControl.currentPage = 0;
        // 设置 UIPageControl 指示点的高亮颜色（当前页的颜色）
        self.pageControl.currentPageIndicatorTintColor = [UIColor  yellowColor];
        
        homeV.headerScroll.contentSize = CGSizeMake(ScreenWidth*(self.imgArray.count+2), 150);
        for (int i=0; i<(self.imgArray.count+2); i++) {
            
            UIImageView *singlePicture = [[UIImageView alloc] initWithFrame:CGRectMake( ScreenWidth * i, 0, ScreenWidth, 150)];
            singlePicture.contentMode = UIViewContentModeScaleAspectFill;
            singlePicture.clipsToBounds = YES;
            
            if (i == 0)
            {
                NSString *imgUrl = [self.imgArray lastObject];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = self.imgArray.count - 1;
            }
            else if (i == self.imgArray.count + 1)
            {
                NSString *imgUrl = [self.imgArray firstObject];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = 0;
            }
            else
            {
                NSString *imgUrl = self.imgArray[i - 1];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = i - 1;
            }
            
            [homeV.headerScroll addSubview:singlePicture];
        }
    }
    //第一张
    homeV.headerScroll.contentOffset = CGPointMake(homeV.headerScroll.bounds.size.width, 0);
    
    [NSTimer  scheduledTimerWithTimeInterval:2 target:self selector:@selector(changePage:) userInfo:nil repeats:YES];
}

-(void)changePage:(NSTimer*)time
{
    if(self.pageCount>=self.imgArray.count)
    {
        self.pageCount = 0;
    }
    self.pageCount++;
    
    [homeV.headerScroll setContentOffset:CGPointMake( ScreenWidth*self.pageCount, 0) animated:YES];
    self.pageControl.currentPage  =  self.pageCount-1;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //偏移位置
    if(homeV.headerScroll.contentOffset.x == 0)
    {
        homeV.headerScroll.contentOffset = CGPointMake(ScreenWidth*self.imgArray.count, 0);
    }
    else if (homeV.headerScroll.contentOffset.x == ScreenWidth*(self.imgArray.count+1))
    {
        homeV.headerScroll.contentOffset = CGPointMake(ScreenWidth*self.imgArray.count, 0);
    }
    //小圆点
    int  currentPage = homeV.headerScroll.contentOffset.x/ScreenWidth;
    if(currentPage == 0)
    {
        self.pageControl.currentPage = self.imgArray.count-1;
    }
    else if (currentPage == self.imgArray.count+1)
    {
        self.pageControl.currentPage = 0;
    }
    else
    {
        self.pageControl.currentPage = currentPage-1;
    }
}

#pragma mark---collection方法
-(void)setupCollection
{
    
    homeV.headerCollection.delegate = self;
    homeV.headerCollection.dataSource = self;
    
    [homeV.headerCollection  registerClass:[CollectionViewCell  class] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSourceArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell *cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.hotModel = self.dataSourceArr[indexPath.row];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrderController   *order = [[OrderController  alloc]init];
    
    [self.navigationController  pushViewController:order animated:YES];
}

#pragma mark---navigationController

-(void)chLeftClick:(UIButton*)sender
{
    [self popUp:sender];
}
-(void)chMiddleClick:(UIButton*)sender
{
    NSLog(@"dianji");
    [self popUp:sender];
    
}
-(void)chRightClick:(UIButton*)sender
{
    [self popUp:sender];
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
        _popUp.frame = CGRectMake(260, 0, 120, 140);
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
