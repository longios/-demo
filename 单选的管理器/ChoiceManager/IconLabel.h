//
//  IconLabel.h
//  ChoiceManager
//
//  Created by Abe on 2017/9/1.
//  Copyright © 2017年 heimavista. All rights reserved.
// 带icon的label

#import <UIKit/UIKit.h>

@interface IconLabel : UIView
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImage *iconImg;
@property (assign, nonatomic) CGSize iconSize;
@property (assign, nonatomic) CGFloat iconLblMargin;
@property (assign, nonatomic) BOOL icononright;

- (instancetype)initWithIcon:(UIImage *)icon label:(UILabel *)label;

@end
