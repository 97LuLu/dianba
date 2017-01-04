//
//  HomeModel.m
//  DianBa
//
//  Created by Apple on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
        NSLog(@"undefinedKey : %@",key);
}
+(instancetype)feedWithDictionary:(NSDictionary *)dictionary
{
    return [[self  alloc]initWithDictionary:dictionary];
}
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.info = dictionary[@"info"];
        self.page_all = dictionary[@"page_all"];
        self.img = dictionary[@"img"];
        self.hot = dictionary[@"hot"];
        self.city = dictionary[@"city"];
        self.page = dictionary[@"page"];
        
    }
    return self;
}

@end

@implementation HomeModel_info
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([@[@"id",@"idd"]containsObject:key])
        self.idd = value;

}
+(instancetype)feedWithDictionary:(NSDictionary *)dictionary
{
    return [[self  alloc]initWithDictionary:dictionary];
}
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.idd = dictionary[@"id"];
        self.store_attr = dictionary[@"store_attr"];
        self.store_name = dictionary[@"store_name"];
        self.store_address = dictionary[@"store_address"];
        self.star = dictionary[@"star"];
        self.store_photo = dictionary[@"store_photo"];
        self.is_outsite = dictionary[@"is_outsite"];
        self.menu_attr = dictionary[@"menu_attr"];
        self.juli = dictionary[@"juli"];
        self.count = dictionary[@"count"];
        
    }
    return self;
}

@end

@implementation HomeModel_hot
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([@[@"id",@"idd"]containsObject:key])
        self.idd = value;

}
+(instancetype)feedWithDictionary:(NSDictionary *)dictionary
{
    return [[self  alloc]initWithDictionary:dictionary];
}
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.idd = dictionary[@"id"];
        self.count = dictionary[@"count"];
        self.store_photo = dictionary[@"store_photo"];
        self.star = dictionary[@"star"];
        self.store_id = dictionary[@"store_id"];
        self.store_name = dictionary[@"store_name"];
        self.is_outsite = dictionary[@"is_outsite"];
        self.menu_attr = dictionary[@"menu_attr"];
        self.juli = dictionary[@"juli"];

    }
    return self;
}


@end
