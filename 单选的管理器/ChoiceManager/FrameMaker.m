//
//  FrameMaker.m
//  ZLFramePro
//
//  Created by Abe on 2017/8/21.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "FrameMaker.h"
#import "UIView+ZLFrameExtension.h"

@interface FrameMaker()
@property (assign, nonatomic) CGRect caculateFrame;
@property (assign, nonatomic) CGPoint caculateCenter;
@property (strong, nonatomic) UIView *view;


@end

@implementation FrameMaker

- (instancetype)initWithOrignView:(UIView *)view {
    if(self = [super init]) {
        self.view = view;
        self.caculateFrame = view.frame;
    }
    return self;
}

//- (FrameMaker *(^)(CGFloat length))returnFrameMakeWithToDoBlock:(void(^)(CGRect frame, CGFloat length))block {
//    return  ^FrameMaker*(CGFloat length) {
//        CGRect frame = self.caculateFrame;
//        block(frame,length);
//        self.caculateFrame = frame;
//        return self;
//    };
//}

- (MakerBlock)mas_width {
    @zlweakify(self);
    return ^FrameMaker *(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.size.width = length;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_height {
     @zlweakify(self);
    return ^FrameMaker *(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.size.height = length;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_x {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.x = length;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_y {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.y = length;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_right {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.x = length - frame.size.width;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_bottom {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.y = length - frame.size.height;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerBlock)mas_centerX {
    @zlweakify(self);
    // centerx  centery 直接赋值给view
    return ^FrameMaker *(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGPoint center = self.caculateCenter;
        center.x = length;
        self.caculateCenter = center;
        return self;
    };
}

- (MakerBlock)mas_centerY {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGPoint center = self.caculateCenter;
        center.y = length;
        self.caculateCenter = center;
        return self;
    };
}

- (MakerOrignBlock)mas_orign {
    @zlweakify(self);
    return ^FrameMaker*(CGPoint point) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin = point;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerSizeBlock)mas_size {
    @zlweakify(self);
    return ^FrameMaker*(CGSize size) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.size = size;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerSizeCaculateBlock)sizeWithBlock {
    @zlweakify(self);
    MakerSizeCaculateBlock block = ^FrameMaker*(SizeBlock sizeBlock) {
        @zlnormalizeReturnNil(self);
        CGSize size = sizeBlock(self.view);
        return self.mas_size(size);
    };
    return block;
}

- (MakerBlock)mas_offsetx {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGFloat x = self.caculateFrame.origin.x + length;
        self.mas_x(x);
        return self;
    };
}

- (MakerBlock)mas_offsety {
    @zlweakify(self);
    return ^FrameMaker*(CGFloat length) {
        @zlnormalizeReturnNil(self);
        CGFloat y = self.caculateFrame.origin.y + length;
        self.mas_y(y);
        return self;
    };
}
#pragma mark "视图对齐"
/**************
         视图的对齐
**************/

- (MakerViewBlock)v_size {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        self.mas_size(view.frame.size);
        return self;
    };
}

- (MakerViewBlock)v_orign {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        self.mas_orign(view.frame.origin);
        return self;
    };
}
- (MakerViewBlock)v_bottom {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
 
        if([view isEqual:[self.view superview]]) {
            CGRect frame = self.caculateFrame;
            frame.origin.y = view.height - frame.size.height;
            self.caculateFrame = frame;
            return self;
        }
        if(view.bottom > 0) {
            self.mas_bottom(view.bottom);
        }
        return self;
    };
}

- (MakerViewBlock)v_right {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        
        if([view isEqual:[self.view superview]]) {
            CGRect frame = self.caculateFrame;
            frame.origin.x = view.width - frame.size.width;
            self.caculateFrame = frame;
            return self;
        }
        
        if(view.right > 0) {
            self.mas_right(view.right);
        }
        return self;
    };
}

- (MakerViewBlock)v_width {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        self.mas_width(view.frame.size.width);
        return self;
    };
}

- (MakerViewBlock)v_height {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        self.mas_height(view.frame.size.height);
        return self;
    };
}

- (MakerViewBlock)v_x {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        if([view isEqual:[self.view superview]]) {
            CGRect frame = self.caculateFrame;
            frame.origin.x = 0;
            self.caculateFrame = frame;
            return self;
        }
        self.mas_x(view.frame.origin.x);
        return self;
    };
}

- (MakerViewBlock)v_y {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        
        if([view isEqual:[self.view superview]]) {
            CGRect frame = self.caculateFrame;
            frame.origin.y = 0;
            self.caculateFrame = frame;
            return self;
        }
        
        self.mas_y(view.frame.origin.y);
        return self;
    };
}

- (MakerViewBlock)v_centerX {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        
        if([view isEqual:[self.view superview]]) {
            CGPoint center = self.caculateCenter;
            center.x = view.width/2;
            self.caculateCenter = center;
            return self;
        }
        self.mas_centerX(view.center.x);
        return self;
    };
}

- (MakerViewBlock)v_centerY {
    @zlweakify(self);
    return ^FrameMaker*(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        if([view isEqual:[self.view superview]]) {
            CGPoint center = self.caculateCenter;
            center.y = view.height/2;
            self.caculateCenter = center;
            return self;
        }
        self.mas_centerY(view.center.y);
        return self;
    };
}

// 下方 父类不做处理
- (MakerViewBlock)v_topEqualBottom {
    @zlweakify(self);
    return ^FrameMaker *(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.y = view.bottom;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerViewBlock)v_leftEqualRight {
    @zlweakify(self);
    return ^FrameMaker *(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.x = view.right;
        self.caculateFrame = frame;
        return self;
    };
}

- (MakerViewBlock)v_rightEqualLeft {
    @zlweakify(self);
    return ^FrameMaker *(__kindof UIView *view) {
        @zlnormalizeReturnNil(self);
        CGRect frame = self.caculateFrame;
        frame.origin.x = view.x - frame.size.width;
        self.caculateFrame = frame;
        return self;
    };
}


- (CGRect)finalFrame {
    return self.caculateFrame;
}

- (CGPoint)finalCenter {
    return self.caculateCenter;
}

@end
