//
//  MHHttpTool.h
//  
//
//  Created by 王辰鹭 on 2016/12/12.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//  处理网络的请求

#import <Foundation/Foundation.h>

@interface MHHttpTool : NSObject


/**
 发送GET请求

 @param URLString 请求的基本的URL
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
+ (void)GET:(NSString *)URLString
                   parameters:(id)parameters
                success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure;

/**
 发送POST请求
 
 @param URLString 请求的基本的URL
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
+ (void)Post:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure;

@end
