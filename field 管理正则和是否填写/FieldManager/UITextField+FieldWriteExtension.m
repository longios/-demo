//
//  UITextField+FieldWriteExtension.m
//  FieldWriteManager
//
//  Created by Abe on 2018/3/1.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "UITextField+FieldWriteExtension.h"

@interface UITextField ()
@property (assign, nonatomic) NSUInteger limitNum;

@end

@implementation UITextField (FieldWriteExtension)

// method

- (BOOL)isWrite {
    if( (self.text.length > 0 && ![self isstrAryContainStr:self.text])) {
        return YES;
    }
    return NO;
}

- (BOOL)isstrAryContainStr:(NSString *)str {
    for(NSString *tempstr in self.emptyStrArys) {
        if([str isEqualToString:tempstr]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isregular {
    if(!self.expression) {
        return YES;
    }
    BOOL issuccess = ([self.expression matchesInString:self.text options:0 range:NSMakeRange(0, self.text.length)].count > 0) ;
    return issuccess;
}

- (void)addEmptyListenWithTip:(NSString *)tip emptyStrArys:(NSArray *)emptyarys; {
    self.emptyTip = tip;
    self.emptyStrArys = emptyarys;
}
- (void)addEmptyListenWithTip:(NSString *)tip {
    self.emptyTip = tip;
}
- (void)addRegularListenWithTip:(NSString *)tip expression:(NSRegularExpression *)expression {
    self.unregularTip = tip;
    self.expression = expression;
}

- (void)limitFieldNumber:(NSUInteger)num {
    self.limitNum = num;
    [self addTarget:self action:@selector(limitNumListen:) forControlEvents:UIControlEventEditingChanged];
}

- (void)limitNumListen:(UITextField *)field {
    if(field.text.length > self.limitNum) {
        if(self.beyondBlock) {
            self.beyondBlock(field.text);
        }
        field.text = [field.text substringToIndex:self.limitNum];
    }
}

#pragma mark "setget"
- (NSString *)unregularTip {
    return objc_getAssociatedObject(self, @selector(unregularTip));
}

- (void)setUnregularTip:(NSString *)unregularTip {
    objc_setAssociatedObject(self, @selector(unregularTip), unregularTip, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)emptyTip {
    return objc_getAssociatedObject(self, @selector(emptyTip));
}

- (void)setEmptyTip:(NSString *)emptyTip {
    objc_setAssociatedObject(self, @selector(emptyTip), emptyTip, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSRegularExpression *)expression {
    return objc_getAssociatedObject(self, @selector(expression));
}

- (void)setExpression:(NSRegularExpression *)expression {
    objc_setAssociatedObject(self, @selector(expression), expression, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)emptyStrArys {
    return objc_getAssociatedObject(self, @selector(emptyStrArys));
}

- (void)setEmptyStrArys:(NSArray *)emptyStrArys {
    objc_setAssociatedObject(self, @selector(emptyStrArys), emptyStrArys, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)setBeyondBlock:(NumberBeyondBlock)beyondBlock {
    objc_setAssociatedObject(self, @selector(beyondBlock), beyondBlock, OBJC_ASSOCIATION_COPY);
}
- (NumberBeyondBlock)beyondBlock {
    return objc_getAssociatedObject(self, @selector(beyondBlock));
}

- (void)setLimitNum:(NSUInteger)limitNum {
    objc_setAssociatedObject(self, @selector(limitNum), @(limitNum), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)limitNum {
    return  [objc_getAssociatedObject(self, @selector(limitNum)) integerValue];
}
@end
