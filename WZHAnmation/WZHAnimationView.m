//
//  WZHAnimationView.m
//  wzhVoice
//
//  Created by wzh on 2017/7/17.
//  Copyright © 2017年 WZH. All rights reserved.
//

#import "WZHAnimationView.h"

@implementation WZHAnimationView
{
    BOOL isend;
}
-(void)drawRect:(CGRect)rect
{
    UIBezierPath* path = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2 - 19;
    CGFloat start = - M_PI_2 + self.timeFlag * 1.1*M_PI;
    CGFloat end = -M_PI_2 + 0.45 * 2 * M_PI  + self.timeFlag * 1.1 *M_PI-1.3333;
    
    [path addArcWithCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    
    if (!self.color1) {
        self.color1 = [UIColor colorWithRed:253/255.0 green:125.0/255.0 blue:7.0/255.0 alpha:1];
    }
    [self.color1 setStroke];
    
    path.lineWidth = 3;
    
    [path stroke];
    
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    NSLog(@"timeflag %f",self.timeFlag);
    
    CGPoint center1 = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius1 = rect.size.width / 2 - 12;
    CGFloat start1 = - M_PI_2 + self.timeFlag * 0.8*M_PI;
    CGFloat end1 = -M_PI_2 + 0.45 * 2 * M_PI  + self.timeFlag * 0.8 *M_PI-1.3333;
    //  if (isend)
    //      [path1 addArcWithCenter:center1 radius:radius1 startAngle:0 endAngle:0 clockwise:YES];
    //  else
    
    [path1 addArcWithCenter:center1 radius:radius1 startAngle:start1 endAngle:end1 clockwise:YES];
    if (!self.color2) {
        self.color2 = [UIColor colorWithRed:28/255.0 green:181.0/255.0 blue:224.0/255.0 alpha:1];
    }
    [self.color2 setStroke];
    
    path1.lineWidth = 3;
    
    [path1 stroke];
    UIBezierPath* path2 = [UIBezierPath bezierPath];
    
    
    CGPoint center2 = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius2 = rect.size.width / 2 - 5;
    CGFloat start2 = - M_PI_2 + self.timeFlag * 0.5*M_PI;
    CGFloat end2 = -M_PI_2 + 0.45 * 2 * M_PI  + self.timeFlag * 0.5 *M_PI-1.3333;
    //if (isend)
    //    [path2 addArcWithCenter:center2 radius:radius2 startAngle:0 endAngle:0 clockwise:YES];
    //else
    [path2 addArcWithCenter:center2 radius:radius2 startAngle:start2 endAngle:end2 clockwise:YES];
    if (!self.color3) {
        self.color3 = [UIColor colorWithRed:39/255.0 green:165.0/255.0 blue:97.0/255.0 alpha:1] ;
    }
    [self.color3 setStroke];
    path2.lineWidth = 3;
    
    [path2 stroke];
    
}
static WZHAnimationView* tmpview ;
+(void)showInView:(UIView *)view
{
    if (tmpview) {
        [tmpview stopAnimation];
        [tmpview removeFromSuperview];
        tmpview = nil;
        
    }
    WZHAnimationView* aview = [[WZHAnimationView  alloc]initWithFrame:CGRectMake(100, 100, 130, 130)];
    aview.backgroundColor = [UIColor clearColor];
    aview.timeFlag = 0;
    aview.center = view.center;
    CGRect rect  = aview.frame;
    rect.origin.y -= 100;
    aview.frame = rect;
    [view addSubview:aview];
    [aview startAnimation];
    tmpview = aview;
}
+(void)dismiss
{
    [tmpview stopAnimation];
    [tmpview removeFromSuperview];
    tmpview = nil;
}
-(void)stopAnimation
{
    isend = YES;
    [self.timer invalidate];
    self.timer = nil;
    [self setNeedsDisplay];
}
-(void)startAnimation{
    
    isend = NO;
    [self.timer invalidate];
    self.timer = nil;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(continueAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer: self.timer forMode:NSRunLoopCommonModes];
    
    
    [self.timer fire];
    
}
#define speed 0.05f     //数值越小越慢
-(void)continueAnimation{
    self.timeFlag += speed;
    
    [self setNeedsDisplay];
    
}
@end
