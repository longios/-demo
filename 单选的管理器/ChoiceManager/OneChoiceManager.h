//
//  OneChoiceManager.h
//  ChoiceManager
//
//  Created by Abe on 2017/9/1.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoiceViewProtocol <NSObject>
- (void)selectedView:(__kindof UIView *)view preSelectedView:(__kindof UIView *)preView;
- (void)viewUnselected:(__kindof UIView *)view;
- (void)repeatSelectedView:(UIView *)selectedView;

@end

@interface OneChoiceManager : NSObject
@property (nonatomic, strong) NSArray<UIView *> *itemViews;
@property (weak, nonatomic) id<ChoiceViewProtocol>choiceDelegate;

- (void)selectedView:(__kindof UIView *)view;
- (void)unselectedCurrentSelectedView;
- (void)selectedIndex:(NSInteger)index;

@end
