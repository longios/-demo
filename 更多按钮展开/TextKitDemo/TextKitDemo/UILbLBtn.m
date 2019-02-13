//
//  UILbLBtn.m
//  TextKitDemo
//
//  Created by Abe on 2018/9/5.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import "UILbLBtn.h"

@interface UILbLBtn ()
@property(strong, nonatomic) ClickBlock clickBlock;
@end

@implementation UILbLBtn


- (void)addClickBlock:(ClickBlock)clickBlock {
    self.clickBlock = clickBlock;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 调用 clickBlock
    if(self.clickBlock) {
        self.clickBlock();
    }
}

@end
