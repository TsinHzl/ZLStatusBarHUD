//
//  UIView+ZLExtension.m
//  ITianCai
//
//  Created by hezhonglin on 16/8/12.
//  Copyright © 2016年 zeb. All rights reserved.
//

#import "UIView+ZLExtension.h"

@implementation UIView (ZLExtension)
//X
-(CGFloat)zl_x
{
    return self.frame.origin.x;
}
- (void)setZl_x:(CGFloat)zl_x
{
    CGRect frame = self.frame;
    frame.origin.x = zl_x;
    self.frame = frame;
}

//Y
- (CGFloat)zl_y
{
    return self.frame.origin.y;
}
- (void)setZl_y:(CGFloat)zl_y
{
    CGRect frame = self.frame;
    frame.origin.y = zl_y;
    self.frame = frame;
}

//点
- (CGPoint)zl_origin
{
    return self.frame.origin;
}
- (void)setZl_origin:(CGPoint)zl_origin
{
    CGRect frame = self.frame;
    frame.origin = zl_origin;
    self.frame = frame;
}

//宽度
- (CGFloat)zl_width
{
    return self.frame.size.width;
}
- (void)setZl_width:(CGFloat)zl_width
{
    CGRect frame = self.frame;
    frame.size.width = zl_width;
    self.frame = frame;
}

//高度
- (CGFloat)zl_height
{
    return self.frame.size.height;
}
- (void)setZl_height:(CGFloat)zl_height
{
    CGRect frame = self.frame;
    frame.size.height = zl_height;
    self.frame = frame;
}

//size
- (CGSize)zl_size
{
    return self.frame.size;
}
- (void)setZl_size:(CGSize)zl_size
{
    CGRect frame = self.frame;
    frame.size = zl_size;
    self.frame = frame;
}

//中心点X
- (CGFloat)zl_centerX
{
    return self.center.x;
}
- (void)setZl_centerX:(CGFloat)zl_centerX
{
    CGPoint center = self.center;
    center.x = zl_centerX;
    self.center = center;
}

//中心点Y
- (CGFloat)zl_centerY
{
    return self.center.y;
}
- (void)setZl_centerY:(CGFloat)zl_centerY
{
    CGPoint center = self.center;
    center.y = zl_centerY;
    self.center = center;
}



/**
 get和set view的右边线的值

 @return  view右边线的值
 */
- (CGFloat)zl_rightLine
{
//    return self.zl_x + self.zl_width;
    return CGRectGetMaxX(self.frame);
}
- (void)setZl_rightLine:(CGFloat)zl_rightLine
{
    self.zl_rightLine = zl_rightLine - self.zl_width;
}

/**
 get和set view底部的线的值

 @return  view的底部线的值
 */
- (CGFloat)zl_bottmLine
{
//    return self.zl_y + self.zl_height;
    return CGRectGetMaxY(self.frame);
}
- (void)setZl_bottmLine:(CGFloat)zl_bottmLine
{
    self.zl_bottmLine = zl_bottmLine - self.zl_height;
}
@end
