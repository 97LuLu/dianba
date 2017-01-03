//
//  HomeRequest.h
//  DianBa
//
//  Created by Apple on 2016/12/31.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHHttpTool.h"
#import "HomeModel.h"

typedef void  (^SuccessBlock)(id imgArr,id infoArr,id hotArr );
typedef void  (^FailureBlock)(id error);

@interface HomeRequest : NSObject

+(void)PostWithListRequest:(SuccessBlock)mainSuccess failure:(FailureBlock)mainFailure;

@end
