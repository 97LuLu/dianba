//
//  UIImage+Image.h
//  墨痕微博
//
//  Created by 王辰鹭 on 2016/11/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// instancetype默认会识别当前是哪个类或对象调用，就会转换成对应的类的对象

//加载最原始的图片，没有渲染
+(instancetype)imageWithOriginaName:(NSString *)imageName;

+(instancetype)imageWithStretchableName:(NSString *)imageName;

@end
