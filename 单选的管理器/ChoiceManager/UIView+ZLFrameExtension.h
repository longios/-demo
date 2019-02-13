//
//  UIView+ZLFrameExtension.h
//  ZLFramePro
//
//  Created by Abe on 2017/8/21.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrameMaker.h"


typedef void(^FrameMake)(FrameMaker *maker);

@interface UIView (ZLFrameExtension)

- (void)mas_makeFrame:(FrameMake)maker;

- (CGFloat)width;

- (void)setWidth:(CGFloat)width;

- (CGFloat)height;

- (void)setHeight:(CGFloat)height;

- (CGPoint)leftTop;

- (void)setLeftTop:(CGPoint)leftTop;

- (CGPoint)rightBottom;

- (void)setRightBottom:(CGPoint)rightBottom;

- (void)setLeft:(CGFloat)left;

- (CGFloat)left;

- (void)setRight:(CGFloat)right;

- (CGFloat)right;

- (void)setX:(CGFloat)x;

- (CGFloat)x;

- (void)setY:(CGFloat)y;

- (CGFloat)y;

- (void)setOrign:(CGPoint)orign;
- (CGPoint)orign;

- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;

- (CGFloat)centerY;

- (void)setSize:(CGSize)size;

- (CGSize)size;

-(CGFloat) top;

-(CGFloat) bottom;
- (void)setBottom:(CGFloat)bottom;

//返回底部 margin距离的Y  主要用给下个视图
- (CGFloat)bottomYWithMargin:(CGFloat)margin;
- (CGFloat)topYWithMargin:(CGFloat)margin;
- (CGFloat)leftXWithMargin:(CGFloat)margin;
- (CGFloat)rightXWithMargin:(CGFloat)margin;

@end
