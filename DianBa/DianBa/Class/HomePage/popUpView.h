//
//  popUpView.h
//  DianBa
//
//  Created by Hunter on 2016/12/29.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface popUpView : UIView<AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *myImgae;


/**
 扫一扫
 */
@property (weak, nonatomic) IBOutlet UIButton *sweepQrButton;

/**
 付款码
 */
@property (weak, nonatomic) IBOutlet UIButton *paymentQrButton;

/**
 登录
 */
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
