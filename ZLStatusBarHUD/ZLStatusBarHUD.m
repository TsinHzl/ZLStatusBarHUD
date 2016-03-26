//
//  ZLStatusBarHUD.m
//  ZLStatusBarHUD
//
//  Created by MacTsin on 16/3/26.
//  Copyright © 2016年 MacTsin. All rights reserved.
//

#import "ZLStatusBarHUD.h"

#define ZLScreenBounds [UIScreen mainScreen].bounds
#define ZLFont [UIFont systemFontOfSize:14]

@implementation ZLStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
static CGFloat ZLWindowsH = 35.0;

static CGFloat ZLTimerInterval = 1.5;
static CGFloat ZLTimeInterval = 0.2;

+ (void)showWindow
{
    if (timer_) [timer_ invalidate];
    window_.hidden = YES;
    
    window_ = [[UIWindow alloc] init];
    CGRect originalF = CGRectMake(0, -ZLWindowsH, ZLScreenBounds.size.width, ZLWindowsH);
    CGRect newFrame = CGRectMake(0, 0, ZLScreenBounds.size.width, ZLWindowsH);
    window_.frame = originalF;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    [UIView animateWithDuration:ZLTimeInterval animations:^{
        window_.frame = newFrame;
    }];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZLTimerInterval target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showSuccessWithMessage:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"ZLStatusBarHUD.bundle/sign_check.ico"]];
}
+ (void)showErrorWithMessage:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"ZLStatusBarHUD.bundle/Error.ico"]];
}
+ (void)showMessage:(NSString *)message image:(UIImage *)image
{
    [self showWindow];
    UIButton *msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    msgButton.frame = window_.bounds;
    [window_ addSubview:msgButton];
    
    [msgButton setTitle:message forState:UIControlStateNormal];
    [msgButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    msgButton.titleLabel.font = ZLFont;
    
    if (image) {
        [msgButton setImage:image forState:UIControlStateNormal];
        msgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    }
}
+ (void)hide
{
    CGRect frame = CGRectMake(0, 0, ZLScreenBounds.size.width, -ZLWindowsH);
    [UIView animateWithDuration:ZLTimeInterval animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];
}

+ (void)showLoading
{
    [self showWindow];
    [timer_ invalidate];
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.frame = window_.bounds;
    [window_ addSubview:messageLabel];
    messageLabel.font = ZLFont;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    
    messageLabel.text = @"正在加载";
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [window_ addSubview:indicator];
    CGFloat textW = [messageLabel.text sizeWithAttributes:@{NSFontAttributeName : ZLFont}].width;
    CGFloat centerX = (window_.bounds.size.width - textW)*0.5 - 20;
    CGFloat centerY = window_.center.y;
    indicator.frame = CGRectMake(0, 0, 50, 50);
    indicator.center = CGPointMake(centerX, centerY);
    [indicator startAnimating];
}
@end
