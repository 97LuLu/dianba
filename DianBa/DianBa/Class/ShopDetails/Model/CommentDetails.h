//
//  CommentDetails.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentDetails : NSObject

/** 昵称 */
@property (nonatomic, copy) NSString *username;
/** 头像 */
@property (nonatomic, copy) NSString *photo;
/** 评论时间 */
@property (nonatomic, copy) NSString *creat_time;
/** 评论内容 */
@property (nonatomic, copy) NSString *content;

@end
