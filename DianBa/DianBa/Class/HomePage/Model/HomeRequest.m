//
//  HomeRequest.m
//  DianBa
//
//  Created by Apple on 2016/12/31.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomeRequest.h"

@implementation HomeRequest

+(void)PostWithListRequest:(SuccessBlock)mainSuccess failure:(FailureBlock)mainFailure
{
    [MHHttpTool  Post:@"http://www.kdiana.com/index.php/Before/HomePage/index" parameters:nil success:^(id responseObject) {
        
        HomeModel  *model = [[HomeModel  alloc]init];
        [model  setValuesForKeysWithDictionary:responseObject];
        NSMutableArray *imgArr = [NSMutableArray  arrayWithArray:model.img];
        
        NSLog(@"=====%@",imgArr);
        
        NSMutableArray  *infoArr = [NSMutableArray  array];
        for (NSDictionary *dic in model.info) {
            HomeModel_info *infoModel = [[HomeModel_info  alloc]init];
            [infoModel  setValuesForKeysWithDictionary:dic];
            [infoArr  addObject:infoModel];
        }
        NSMutableArray  * hotArr = [NSMutableArray  array];
        for (NSDictionary *hotDic in model.hot) {
            HomeModel_hot *hotModel = [[HomeModel_hot  alloc]init];
            [hotModel  setValuesForKeysWithDictionary:hotDic];
            [hotArr  addObject:hotModel];

        }
        mainSuccess(imgArr,infoArr,hotArr);
        
        
    } failure:^(NSError *error) {
        
        
    }];
}

@end
