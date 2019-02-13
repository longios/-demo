//
//  UILbLBtn.h
//  TextKitDemo
//
//  Created by Abe on 2018/9/5.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(void);

@interface UILbLBtn : UILabel

- (void)addClickBlock:(ClickBlock)clickBlock;

@end
