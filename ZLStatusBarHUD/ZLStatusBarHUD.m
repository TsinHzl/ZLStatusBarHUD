//
//  ZLStatusBarHUD.m
//  ZLStatusBarHUD
//
//  Created by MacTsin on 16/3/26.
//  Copyright © 2016年 MacTsin. All rights reserved.
//

#import "ZLStatusBarHUD.h"
#import "UIView+ZLExtension.h"

#define ZLScreenBounds [UIScreen mainScreen].bounds
#define ZLScreenHeight [UIScreen mainScreen].bounds.size.height
#define ZLFont [UIFont systemFontOfSize:14]

@implementation ZLStatusBarHUD

static UIWindow *window_ = nil;
static NSTimer *timer_ = nil;

static CGFloat const ZLWindowsH = 35.0;
static CGFloat const ZLTimerInterval = 1.5;
static CGFloat const ZLTimeInterval = 0.2;

+ (void)showWindow
{
    if (timer_) [timer_ invalidate];
    window_.hidden = YES;
    
    CGFloat windowH = ZLScreenHeight >= 812.f ? ZLWindowsH + 24.f : ZLWindowsH;
    window_ = [[UIWindow alloc] init];
    CGRect originalF = CGRectMake(0, -ZLWindowsH, ZLScreenBounds.size.width, windowH);
    CGRect newFrame = CGRectMake(0, 0, ZLScreenBounds.size.width, windowH);
    window_.frame = originalF;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    window_.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    
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
    msgButton.frame = CGRectMake(0, window_.zl_height - ZLWindowsH, window_.zl_width, ZLWindowsH);
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
    messageLabel.frame = CGRectMake(0, window_.zl_height - ZLWindowsH, window_.zl_width, ZLWindowsH);
    [window_ addSubview:messageLabel];
    messageLabel.font = ZLFont;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    
    messageLabel.text = @"正在加载";
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [window_ addSubview:indicator];
    CGFloat textW = [messageLabel.text sizeWithAttributes:@{NSFontAttributeName : ZLFont}].width;
    CGFloat centerX = (window_.bounds.size.width - textW)*0.5 - 20;
    CGFloat centerY = messageLabel.zl_centerY;
    indicator.frame = CGRectMake(0, 0, 50, 50);
    indicator.center = CGPointMake(centerX, centerY);
    [indicator startAnimating];
}
@end
