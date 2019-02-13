//
//  CoverView.m
//  TextKitDemo
//
//  Created by Abe on 2018/9/6.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import "CoverView.h"

@interface CoverView ()
@property(strong, nonatomic) TouchLbl *touchLbl;
@end

@implementation CoverView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupview];
    }
    return self;
}

- (void)setAttr:(NSAttributedString *)attr {
    _attr = attr;
    self.touchLbl.attributedText = attr;
    [self.touchLbl sizeToFit];
}

- (void)setupview {
//    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.touchLbl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.touchLbl.frame = CGRectMake(0, 0, self.touchLbl.frame.size.width, self.touchLbl.frame.size.height);
}

- (void)setClickBlock:(ClickBlock)clickBlock {
    _clickBlock = clickBlock;
    self.touchLbl.touchBlock = self.clickBlock;
}

- (TouchLbl *)touchLbl {
    if(!_touchLbl) {
        _touchLbl = [[TouchLbl alloc] init];
//        _touchLbl.backgroundColor = [UIColor greenColor];
        _touchLbl.userInteractionEnabled = YES;
    }
    return _touchLbl;
}

- (CGSize)btnsize {
    return self.touchLbl.frame.size;
}

@end


@implementation TouchLbl

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(self.touchBlock) {
        self.touchBlock();
    }
}

@end
