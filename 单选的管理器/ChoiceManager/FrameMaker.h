//
//  FrameMaker.h
//  ZLFramePro
//
//  Created by Abe on 2017/8/21.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
// 模仿masony的布局

#undef zlweakify
#define zlweakify( x )    autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;

#undef    zlnormalizeReturnNil
#define zlnormalizeReturnNil( x )    try{} @finally{} __typeof__(x) x = __weak_##x##__;if(x==nil)return nil;

@interface FrameMaker : NSObject
typedef CGSize (^SizeBlock)(__kindof UIView *view);
typedef FrameMaker *(^MakerBlock)(CGFloat length);
typedef FrameMaker *(^MakerOrignBlock)(CGPoint orign);
typedef FrameMaker *(^MakerSizeBlock)(CGSize size);
typedef FrameMaker *(^MakerSizeCaculateBlock)(SizeBlock sizeBlock);

typedef FrameMaker *(^MakerViewBlock)(__kindof UIView *view);



- (instancetype)initWithOrignView:(UIView *)view;
// 传入数值 对视图直接赋值
//- (MakerBlock)mas_width;
@property (nonatomic, copy, readonly) MakerBlock mas_width;
//- (MakerBlock)mas_height;
@property (nonatomic, copy, readonly) MakerBlock mas_height;
//- (MakerBlock)mas_x;
@property (nonatomic, copy, readonly) MakerBlock mas_x;
//- (MakerBlock)mas_y;
@property (nonatomic, copy, readonly) MakerBlock mas_y;
//- (MakerBlock)mas_centerX;
@property (nonatomic, copy, readonly) MakerBlock mas_centerX;
//- (MakerBlock)mas_centerY;
@property (nonatomic, copy, readonly) MakerBlock mas_centerY;
//- (MakerBlock)mas_right;
@property (nonatomic, copy, readonly) MakerBlock mas_right;
//- (MakerBlock)mas_bottom;
@property (nonatomic, copy, readonly) MakerBlock mas_bottom;
//- (MakerOrignBlock)mas_orign;
@property (nonatomic, copy, readonly) MakerOrignBlock mas_orign;
//- (MakerSizeBlock)mas_size;
@property (nonatomic, copy, readonly) MakerSizeBlock mas_size;

// 传入block对视图赋值
//- (MakerSizeCaculateBlock)sizeWithBlock;
@property (nonatomic, copy, readonly) MakerSizeCaculateBlock sizeWithBlock;

// 传入视图对本身视图进行赋值
@property (nonatomic, copy, readonly) MakerViewBlock v_width;
@property (nonatomic, copy, readonly) MakerViewBlock v_height;
@property (nonatomic, copy, readonly) MakerViewBlock v_x;
@property (nonatomic, copy, readonly) MakerViewBlock v_y;
@property (nonatomic, copy, readonly) MakerViewBlock v_centerX;
@property (nonatomic, copy, readonly) MakerViewBlock v_centerY;
@property (nonatomic, copy, readonly) MakerViewBlock v_right;
       // 父类的情况下   目前只支持一级父类  bottom与 父类对齐  right  left x  y centerx  centerY 一样
@property (nonatomic, copy, readonly) MakerViewBlock v_bottom;
@property (nonatomic, copy, readonly) MakerViewBlock v_orign;
@property (nonatomic, copy, readonly) MakerViewBlock v_size;

// top = view bottom
@property (nonatomic, copy, readonly) MakerViewBlock v_topEqualBottom;
// left = view right
@property (nonatomic, copy, readonly) MakerViewBlock v_leftEqualRight;
// right = view left
@property (nonatomic, copy, readonly) MakerViewBlock v_rightEqualLeft;

//
@property (nonatomic, copy, readonly) MakerBlock mas_offsetx;
@property (nonatomic, copy, readonly) MakerBlock mas_offsety;


// 用于获取最终的frame 让view调用
- (CGRect)finalFrame;
- (CGPoint)finalCenter;

@end
