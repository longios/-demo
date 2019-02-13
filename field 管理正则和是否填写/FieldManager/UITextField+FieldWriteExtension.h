//
//  UITextField+FieldWriteExtension.h
//  FieldWriteManager
//
//  Created by Abe on 2018/3/1.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^NumberBeyondBlock)( NSString *str);

@interface UITextField (FieldWriteExtension)

// 如果text是emptyStrArys中的字符串 則為空(例如請選擇這種字段)
@property (strong, nonatomic) NSArray *emptyStrArys;
@property (strong, nonatomic) NSString *emptyTip;
- (BOOL)isWrite;
- (void)addEmptyListenWithTip:(NSString *)tip emptyStrArys:(NSArray *)emptyarys;
- (void)addEmptyListenWithTip:(NSString *)tip;

// 正则表达式
@property (strong, nonatomic) NSString *unregularTip;
@property (strong, nonatomic) NSRegularExpression *expression;
- (BOOL)isregular;
- (void)addRegularListenWithTip:(NSString *)tip expression:(NSRegularExpression *)expression;

// 限制字数
@property (copy, nonatomic) NumberBeyondBlock beyondBlock;
- (void)limitFieldNumber:(NSUInteger)num;

@end
