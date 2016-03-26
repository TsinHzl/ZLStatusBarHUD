//
//  ZLStatusBarHUD.h
//  ZLStatusBarHUD
//
//  Created by MacTsin on 16/3/26.
//  Copyright © 2016年 MacTsin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLStatusBarHUD : NSObject
/** 显示成功信息 **/
+ (void)showSuccessWithMessage:(NSString *)message;
/** 显示失败信息 **/
+ (void)showErrorWithMessage:(NSString *)message;
/** 显示带图片普通信息 **/
+ (void)showMessage:(NSString *)message image:(UIImage *)image;
/** 显示加载信息 **/
+ (void)showLoading;
/** 显示成功信息 **/
+ (void)hide;
@end
