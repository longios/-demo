//
//  FieldWriteManager.h
//  FieldWriteManager
//
//  Created by Abe on 2018/3/1.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+FieldWriteExtension.h"

@interface FieldWriteManager : NSObject
@property (weak, nonatomic) UIView *tipview;
@property (strong, nonatomic) UITextField *unwriteField;
@property (strong, nonatomic) UITextField *unRegularField;
- (instancetype)initWithtipview:(UIView *)tipview; 
- (BOOL)isAllWrite;
- (BOOL)isAllRegular;
//- (void)beginListen;
// 這裡是用來判斷是否empty
- (void)addField:(UITextField *)field;
- (void)addFields:(NSArray *)fields;
- (void)removefields:(NSArray *)fields;
// 這裡是用來判斷是否符合正則
- (void)addRegularField:(UITextField *)field;
- (void)addRegularFields:(NSArray *)fields;
- (void)removeRegularFields:(NSArray *)fields;

@end
