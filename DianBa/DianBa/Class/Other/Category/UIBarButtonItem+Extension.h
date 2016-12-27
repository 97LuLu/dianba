//
//  UIBarButtonItem+Extension.h
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                    target:(id)target
                                    action:(SEL)action;
@end
