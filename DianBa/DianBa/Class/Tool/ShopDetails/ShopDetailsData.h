//
//  ShopDetailsData.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShopDetailsResult;

@interface ShopDetailsData : NSObject

+(void)shopDetailsWithStoreId:(NSString *)storeId success:(void(^)(ShopDetailsResult *shopDetails))success failure:(void(^)(NSError *error))failure;

@end
