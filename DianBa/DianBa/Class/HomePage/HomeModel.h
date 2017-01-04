//
//  HomeModel.h
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeModel_info;
@class HomeModel_hot;

@interface HomeModel : NSObject

@property(nonatomic,strong)NSArray   *info;
@property(nonatomic,strong)NSNumber  *page_all;
@property(nonatomic,strong)NSNumber  *page;
@property(nonatomic,strong)NSArray   *img;
@property(nonatomic,strong)NSArray   *hot;
@property(nonatomic,strong)NSString  *city;

+(instancetype) feedWithDictionary:(NSDictionary*)dictionary;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;
@end

@interface HomeModel_info : NSObject

@property(nonatomic,strong)NSString   *idd;
@property(nonatomic,strong)NSString  *store_attr;
@property(nonatomic,strong)NSString  *store_name;
@property(nonatomic,strong)NSString  *store_address;
@property(nonatomic,strong)NSString  *star;
@property(nonatomic,strong)NSString  *store_photo;
@property(nonatomic,strong)NSString  *is_outsite;
@property(nonatomic,strong)NSString  *menu_attr;
@property(nonatomic,strong)NSString  *juli;
@property(nonatomic,strong)NSString  *count;

@end

@interface HomeModel_hot : NSObject

@property(nonatomic,strong)NSString  *idd;
@property(nonatomic,strong)NSString  *count;
@property(nonatomic,strong)NSString  *store_photo;
@property(nonatomic,strong)NSString  *star;
@property(nonatomic,strong)NSString  *menu_attr;
@property(nonatomic,strong)NSString  *store_id;
@property(nonatomic,strong)NSString  *store_name;
@property(nonatomic,strong)NSString  *is_outsite;
@property(nonatomic,strong)NSString  *juli;

@end



