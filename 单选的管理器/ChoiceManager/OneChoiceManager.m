//
//  OneOneChoiceManager.m
//  OneChoiceManager
//
//  Created by Abe on 2017/9/1.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "OneChoiceManager.h"
@interface OneChoiceManager ()
@property (strong, nonatomic) NSSet *viewsets;
@property (nonatomic, strong) UIView *selectedView;
@end

// 单选管理器
@implementation OneChoiceManager

- (void)selectedView:(__kindof UIView*)view {
    if(![self.viewsets containsObject:view]) {
        return;
    }
    if([view isEqual:self.selectedView]) {
        if([self.choiceDelegate respondsToSelector:@selector(repeatSelectedView:)]) {
            [self.choiceDelegate repeatSelectedView:self.selectedView];
        }
        return;
    }
    if([self.choiceDelegate respondsToSelector:@selector(selectedView:preSelectedView:)]) {
        [self.choiceDelegate selectedView:view preSelectedView:self.selectedView];
    }
    self.selectedView = view;
}

- (void)unselectedCurrentSelectedView {
    if(!self.selectedView) {
        return;
    }
    if([self.choiceDelegate respondsToSelector:@selector(viewUnselected:)]) {
        [self.choiceDelegate viewUnselected:self.selectedView];
    }
    self.selectedView = nil;
}

- (void)setItemViews:(NSArray<UIView *> *)itemViews {
    _itemViews = itemViews;
    self.viewsets = [[NSSet alloc] initWithArray:_itemViews];
}

- (void)selectedIndex:(NSInteger)index {
    if(index > self.itemViews.count - 1) {
        return;
    }
    UIView *view = [self.itemViews objectAtIndex:index];
    [self selectedView:view];
}


@end
