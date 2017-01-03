//
//  ShopDetailsResult.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopDetailsResult : NSObject<MJKeyValue>

/** 门店ID */
@property (nonatomic, copy) NSString *store_id;
/** 门店名称 */
@property (nonatomic, copy) NSString *store_name;
/** 是否支持外卖(0不支持   1支持) */
@property (nonatomic, copy) NSString *is_outsite;
/** 门店介绍 */
@property (nonatomic, copy) NSString *store_con;
/** 许可证 */
@property (nonatomic, copy) NSString *store_license;
/** 营业开始时间 */
@property (nonatomic, copy) NSString *business_time_start;
/** 营业结束时间 */
@property (nonatomic, copy) NSString *business_time_over;
/** 食品安全许可证 */
@property (nonatomic, copy) NSString *food_business_licenses;
/** 门店地址 */
@property (nonatomic, copy) NSString *store_address;
/** 门店所属类别*/
@property (nonatomic, copy) NSString *menu_attr;
/** 评星 */
@property (nonatomic, copy) NSString *star;
/** 门店图片 */
@property (nonatomic, strong) NSArray *store_img;
/** 配送费 */
@property (nonatomic, copy) NSString *distribut;
/** 回复数 */
@property (nonatomic, copy) NSString *count_rated;
/** 交易数 */
@property (nonatomic, copy) NSString *turnover;
/** 回复详情 */
@property (nonatomic, strong) NSArray *comment;

@end
