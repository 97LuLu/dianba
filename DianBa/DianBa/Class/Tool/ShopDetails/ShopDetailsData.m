//
//  ShopDetailsData.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsData.h"
#import "ShopDetailsParam.h"
#import "ShopDetailsResult.h"

@implementation ShopDetailsData

+ (void)shopDetailsWithStoreId:(NSString *)storeId success:(void (^)(ShopDetailsResult *))success failure:(void (^)(NSError *))failure{
    
    ShopDetailsParam *param = [[ShopDetailsParam alloc] init];
    param.store_id = storeId;
    
    [MHHttpTool Post:@"http://60.205.200.247/wdd/back_kdiana/index.php/Before/HomePage/store_info" parameters:param.mj_keyValues success:^(id responseObject) {
        
        ShopDetailsResult *result = [ShopDetailsResult mj_objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
