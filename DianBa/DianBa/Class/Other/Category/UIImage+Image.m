//
//  UIImage+Image.m
//  墨痕微博
//
//  Created by 王辰鹭 on 2016/11/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+(instancetype)imageWithOriginaName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

+(instancetype)imageWithStretchableName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
}

@end
