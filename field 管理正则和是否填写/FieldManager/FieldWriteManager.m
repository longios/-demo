//
//  FieldWriteManager.m
//  FieldWriteManager
//
//  Created by Abe on 2018/3/1.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "FieldWriteManager.h"

@interface FieldWriteManager ()
@property (strong, nonatomic) NSMutableArray *fields;
@property (strong, nonatomic) NSMutableArray *regularFields;

@end

@implementation FieldWriteManager
- (instancetype)initWithtipview:(UIView *)tipview {
    self = [super init];
    if(self) {
        self.tipview = tipview;
    }
    return self;
}

- (BOOL)isAllWrite {
    for(UITextField *field in self.fields) {
        if(![field isWrite]) {
            // 提醒   hud   emptyTip
            self.unwriteField = field;
            NSLog(@"%@",field.emptyTip);
//            [[HVMBProgressHUD showTipHUDWithMsg:field.emptyTip addedTo:self.tipview] addHideGesture];
            return NO;
        }
    }
    return YES;
}

- (BOOL)isAllRegular {
    for(UITextField *field in self.regularFields) {
        if(![field isregular]) {
            // 提醒 hud unregularTip
            self.unRegularField = field;
            NSLog(@"%@", field.unregularTip);
//            [[HVMBProgressHUD showTipHUDWithMsg:field.unregularTip addedTo:self.tipview] addHideGesture];
            return NO;
        }
    }
    return YES;
}

- (void)addField:(UITextField *)field {
    [self.fields addObject:field];
//    [self beginListen];
}
- (void)addFields:(NSArray *)fields {
    [self.fields addObjectsFromArray:fields];
//    [self beginListen];
}
- (void)removefields:(NSArray *)fields {
    [self.fields removeObjectsInArray:fields];
}

- (void)addRegularField:(UITextField *)field {
    [self.regularFields addObject:field];
}
- (void)addRegularFields:(NSArray *)fields {
    [self.regularFields addObjectsFromArray:fields];
}
- (void)removeRegularFields:(NSArray *)fields {
    [self.regularFields removeObjectsInArray:fields];
}

- (NSMutableArray *)fields {
    if(!_fields) {
        _fields = [NSMutableArray array];
    }
    return _fields;
}

- (NSMutableArray *)regularFields {
    if(!_regularFields) {
        _regularFields = [NSMutableArray array];
    }
    return _regularFields;
}

- (UIView *)tipview {
    if(!_tipview) {
        _tipview = [UIApplication sharedApplication].keyWindow;
    }
    return _tipview;
}

@end
