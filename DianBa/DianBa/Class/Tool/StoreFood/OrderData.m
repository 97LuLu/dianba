//
//  OrderData.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderData.h"
#import "OrderParam.h"
#import "OrderResult.h"

@implementation OrderData

+ (void)storeFoodWithStoreId:(NSString *)storeId success:(void (^)(OrderResult *))success failure:(void (^)(NSError *))failure{
    
    OrderParam *params = [[OrderParam alloc] init];
    params.store_id = storeId;
    
    [MHHttpTool Post:@"http://www.kdiana.com/index.php/Before/Orders/menu_list" parameters:params.mj_keyValues success:^(id responseObject) {
        
        OrderResult *result = [OrderResult mj_objectWithKeyValues:responseObject];
        
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
