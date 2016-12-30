//
//  OrderData.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderResult;

@interface OrderData : NSObject

+(void)storeFoodWithStoreId:(NSString *)storeId success:(void(^)(OrderResult *storeFoods))success failure:(void(^)(NSError *error))failure;

@end
