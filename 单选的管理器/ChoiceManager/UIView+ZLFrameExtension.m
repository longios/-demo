//
//  UIView+ZLFrameExtension.m
//  ZLFramePro
//
//  Created by Abe on 2017/8/21.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "UIView+ZLFrameExtension.h"


@implementation UIView (ZLFrameExtension)

- (void)mas_makeFrame:(FrameMake)maker {
    FrameMaker *frameMaker = [[FrameMaker alloc] initWithOrignView:self];
    maker(frameMaker);
    self.frame = [frameMaker finalFrame];
    CGPoint center = [frameMaker finalCenter];
    if(center.x != 0) {
        self.centerX = center.x;
    }
    if(center.y != 0) {
        self.centerY = center.y;
    }
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
}

- (CGPoint)leftTop
{
    CGPoint result = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    return result;
}

- (void)setLeftTop:(CGPoint)leftTop
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(leftTop.x, leftTop.y, frame.size.width, frame.size.height);
}

- (CGPoint)rightBottom
{
    CGPoint result = CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
    return result;
}



- (void)setRightBottom:(CGPoint)rightBottom
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(rightBottom.x - frame.size.width, rightBottom.y - frame.size.height, frame.size.width, frame.size.height);
}

-(CGFloat) top{
    return self.frame.origin.y;
}


- (void)setBottom:(CGFloat )bottom {
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, bottom - frame.size.height, frame.size.width, frame.size.height);
}
-(CGFloat) bottom{
    return self.frame.origin.y + self.frame.size.height;
}




- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(left, frame.origin.y, frame.size.width, frame.size.height);
}

- (CGFloat)left;
{
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(right - frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setOrign:(CGPoint)orign {
    CGRect frame = self.frame;
    frame.origin = orign;
    self.frame = frame;
}
- (CGPoint)orign {
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}



- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
- (CGFloat)bottomYWithMargin:(CGFloat)margin{
    return CGRectGetMaxY(self.frame)+margin;
}
- (CGFloat)topYWithMargin:(CGFloat)margin{
    return self.y - margin;
}
- (CGFloat)leftXWithMargin:(CGFloat)margin{
    return self.x - margin;
}
- (CGFloat)rightXWithMargin:(CGFloat)margin{
    return CGRectGetMaxX(self.frame)+margin;
}

@end
