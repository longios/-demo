//
//  MoreTextLbl.h
//  TextKitDemo
//
//  Created by Abe on 2018/9/7.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoreTextSizeChangeDelegate<NSObject>
- (void)sizeChangeWithSize:(CGSize)size;
@end

@interface MoreTextLbl : UIView
@property(weak, nonatomic)id<MoreTextSizeChangeDelegate> delegate;
// 不带收起按钮
- (void)setWithAttrStr:(NSAttributedString *)attrStr moreBtnAttrStr:(NSAttributedString *)moreBtnAttr;
// 带收起按钮
- (void)setWithAttrStr:(NSAttributedString *)attrStr moreBtnAttrStr:(NSAttributedString *)moreBtnAttr packupStr:(NSAttributedString *)packupStr;

@end
