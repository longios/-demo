//
//  IconLabel.m
//  ChoiceManager
//
//  Created by Abe on 2017/9/1.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "IconLabel.h"
#import "UIView+ZLFrameExtension.h"

@interface IconLabel ()
@property (strong, nonatomic) UIImageView *icon;
@property (assign, nonatomic) CGSize lblsize;

@end

@implementation IconLabel

- (instancetype)init
{
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        self.iconLblMargin = 5;
        [self setupview];
    }
    return self;
}

- (instancetype)initWithIcon:(UIImage *)icon label:(UILabel *)label {
    self.iconImg = icon;
    self.label = label;
    self = [self init];
    return self;
    
}

- (void)setupview {
    [self addSubview:self.label];
    self.icon = [[UIImageView alloc] initWithImage:self.iconImg];
    
    [self addSubview:self.icon];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize lblsize = [self.label sizeThatFits:CGSizeMake(size.width - 10 - self.iconSize.width - self.iconLblMargin, MAXFLOAT)];
    lblsize = CGSizeMake(lblsize.width, (size.height-10) < lblsize.height ? (size.height - 10) : lblsize.height );
    self.lblsize = lblsize;
    
    CGFloat height = self.iconSize.height > lblsize.height ? self.iconSize.height : lblsize.height;
    height += 10;
    return CGSizeMake(size.width, height);
}

- (void)setIconImg:(UIImage *)iconImg {
    _iconImg = iconImg;
    self.iconSize = iconImg.size;
    self.icon.image = _iconImg;
}

- (void)setIconSize:(CGSize)iconSize {
    _iconSize = iconSize;
    self.icon.size = iconSize;
    [self layoutIfNeeded];
}

- (void)setIconLblMargin:(CGFloat)iconLblMargin {
    _iconLblMargin = iconLblMargin;
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.icon.frame = CGRectMake(5, 0, self.iconSize.width, self.iconSize.height);
    self.icon.centerY = self.height / 2;
    
    self.label.size = self.lblsize;
    self.label.x = self.icon.right + self.iconLblMargin;
    self.label.centerY = self.height / 2;
    
    if(self.icononright) {
        self.label.x = 5;
        self.icon.x = self.label.right + self.iconLblMargin;
    }
    
}

@end
