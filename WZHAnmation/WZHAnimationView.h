//
//  WZHAnimationView.h
//  wzhVoice
//
//  Created by wzh on 2017/7/17.
//  Copyright © 2017年 WZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZHAnimationView : UIView

@property (nonatomic, assign) CGFloat timeFlag;
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, strong) UIColor* color1;//内圆颜色
@property (nonatomic, strong) UIColor* color2;//中间颜色
@property (nonatomic, strong) UIColor* color3;//外圈颜色

-(void)startAnimation;//
-(void)stopAnimation;
+(void)showInView:(UIView *)view;//显示动画
+(void)dismiss;//停止动画

@end
