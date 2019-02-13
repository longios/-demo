//
//  UILabel+HVKRTZlLblExtension.h
//  hvkrtcoview
//
//  Created by Abe on 16/9/20.
//  Copyright © 2016年 hv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HVKRTZlLblExtension)
+ (instancetype)zl_CreateWithStr:(NSString *)textStr
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor;

+ (UILabel *)zl_CreateWithStr:(NSString *)textStr
               systemFontSize:(CGFloat )fontSize
                    textColor:(UIColor *)textColor;



//限制算出的size大小  防止越界

- (CGSize)zl_SizeFitFixactionHeight:(CGFloat)height limitWidth:(CGFloat)width;

- (CGSize)zl_SizeFitFixActionWidth:(CGFloat)width limitHeight:(CGFloat)height;

@end
