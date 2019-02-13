//
//  NSRegularExpression+HVMarsFactoryExtension.m
//  hvkrtcologic
//
//  Created by Abe on 2018/1/2.
//  Copyright © 2018年 hv. All rights reserved.
//

#import "NSRegularExpression+HVMarsFactoryExtension.h"

@implementation NSRegularExpression (HVMarsFactoryExtension)
+ (NSRegularExpression *)emailRegularExpression {
    NSString *pattern = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
    NSRegularExpression *emailexpression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    return emailexpression;
}

+ (NSRegularExpression *)phoneRegularExpression {
    NSString *pattern = @"9[0-9]{8}";
    NSRegularExpression *phonePression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    return phonePression;
}

+ (NSRegularExpression *)passwordRegularExpression {
    NSString *pattern = @"^(?!([^a-zA-Z]+|\\D+)$)[a-zA-Z0-9]{6,12}$";
    NSRegularExpression *passworkPression = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    return passworkPression;
}

+ (NSRegularExpression *)idnumberRegularExpression {
    NSString *pattern = @"^[a-zA-Z][0-9]{9}$";
    NSRegularExpression *passworkPression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    return passworkPression;
}

@end
