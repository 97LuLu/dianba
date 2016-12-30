//
//  GVColor.h
//  Color
//
//  Created by Viosky on 2016/12/13.
//  Copyright © 2016年 Viosky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVColor : UIColor

/**
 @brief 颜色处理的方法

 @param stringToConvert 填写颜色

 @return 返回颜色
 */
+ (UIColor *)hexStringToColor: (NSString *) stringToConvert;
@end
