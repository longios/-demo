//
//  CoverView.h
//  TextKitDemo
//
//  Created by Abe on 2018/9/6.
//  Copyright © 2018年 Abe. All rights reserved.
//
// 用于覆盖住 textview的后面  让后面不在显示文字

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(void);
@interface CoverView : UIView
@property(strong, nonatomic) NSAttributedString *attr;
@property(copy, nonatomic) ClickBlock clickBlock;
@property(assign, nonatomic, readonly) CGSize btnsize;

@end

@interface TouchLbl : UILabel
@property(copy, nonatomic) ClickBlock touchBlock;
@end
