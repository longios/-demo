//
//  NSRegularExpression+HVMarsFactoryExtension.h
//  hvkrtcologic
//
//  Created by Abe on 2018/1/2.
//  Copyright © 2018年 hv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (HVMarsFactoryExtension)
+ (NSRegularExpression *)emailRegularExpression;
+ (NSRegularExpression *)phoneRegularExpression;
+ (NSRegularExpression *)passwordRegularExpression;
+ (NSRegularExpression *)idnumberRegularExpression;

@end
