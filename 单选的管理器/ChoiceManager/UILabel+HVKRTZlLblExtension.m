//
//  UILabel+HVKRTZlLblExtension.m
//  hvkrtcoview
//
//  Created by Abe on 16/9/20.
//  Copyright © 2016年 hv. All rights reserved.
//

#import "UILabel+HVKRTZlLblExtension.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation UILabel (HVKRTZlLblExtension)
+ (instancetype)zl_CreateWithStr:(NSString *)textStr
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
{
    UILabel *lb = [[[self class] alloc] init];
    lb.numberOfLines = 0;// 默认不限行数
    [lb setTextColor:textColor];
    [lb setFont:font];
    lb.text = textStr;
    return lb;
}

+ (UILabel *)zl_CreateWithStr:(NSString *)textStr
               systemFontSize:(CGFloat )fontSize
                    textColor:(UIColor *)textColor
{
    UILabel *lbl = [self zl_CreateWithStr:textStr font:nil textColor:textColor];
    [lbl setFont:[UIFont systemFontOfSize:fontSize]];
    return lbl;
}





- (CGSize)zl_SizeFitFixactionHeight:(CGFloat)height limitWidth:(CGFloat)width{
    CGSize size = [self sizeThatFits:CGSizeMake(MAXFLOAT, height)];
    size.width = size.width<width?size.width : width;
    return size;
}

- (CGSize)zl_SizeFitFixActionWidth:(CGFloat)width limitHeight:(CGFloat)height{
    CGSize size = [self sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    size.height = size.height< height?size.height : height;
    return size;
}


@end
