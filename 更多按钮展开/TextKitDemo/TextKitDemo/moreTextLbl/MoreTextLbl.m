//
//  MoreTextLbl.m
//  TextKitDemo
//
//  Created by Abe on 2018/9/7.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import "MoreTextLbl.h"
#import "CoverView.h"

@interface MoreTextLbl()
@property(strong, nonatomic) NSTextContainer *container;
@property(strong, nonatomic) NSTextStorage *storage;
@property(strong, nonatomic) NSLayoutManager *layoutManager;
@property(strong, nonatomic) UITextView *textView;
@property(strong, nonatomic) CoverView *coverView;
@property(strong, nonatomic) CoverView *packUpView;
@property(strong, nonatomic) NSAttributedString *attrStr;
@property(strong, nonatomic) NSAttributedString *moreBtnAttr;
@property(assign, nonatomic) CGFloat oneLineHeight;

@property(strong, nonatomic) NSAttributedString *packUpBtnAttr; // 收起按钮
@property(assign, nonatomic) BOOL showPackupBtn; // 是否展示收起按钮
@property(assign, nonatomic) CGRect orignFrame; // lbl原有的大小
@property(assign, nonatomic) CGSize addPackupSize;
@property(strong, nonatomic) UIBezierPath *orignPath;
@end

@implementation MoreTextLbl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.orignFrame = frame;
    }
    return self;
}

- (void)setWithAttrStr:(NSAttributedString *)attrStr moreBtnAttrStr:(NSAttributedString *)moreBtnAttr {
    self.attrStr = attrStr;
    self.moreBtnAttr = moreBtnAttr;
    self.coverView.attr = moreBtnAttr;
    self.storage = [[NSTextStorage alloc] initWithAttributedString:attrStr];
    self.layoutManager = [[NSLayoutManager alloc] init];
    [self.storage addLayoutManager:self.layoutManager];
    self.container = [[NSTextContainer alloc] initWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    self.container.lineFragmentPadding = 0;
    [self.layoutManager addTextContainer:self.container];
    [self.textView removeFromSuperview];
    self.textView = nil;
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) textContainer:self.container];
    self.textView.editable = NO;
    self.textView.userInteractionEnabled = NO;
//    self.textView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.textView];
    [self addCoverIfNeeded];
}

// 收起按钮
- (void)setWithAttrStr:(NSAttributedString *)attrStr moreBtnAttrStr:(NSAttributedString *)moreBtnAttr packupStr:(NSAttributedString *)packupStr {
    if(packupStr.string.length) {
        self.showPackupBtn = YES;
        self.packUpBtnAttr = packupStr;
        self.packUpView.attr = packupStr;
    }
    [self setWithAttrStr:attrStr moreBtnAttrStr:moreBtnAttr];
}

- (void)addCoverIfNeeded {
    NSRange range = [self.layoutManager glyphRangeForTextContainer:self.container];
    if(range.length < self.attrStr.length) {
        [self.coverView removeFromSuperview];
        [self addSubview:self.coverView];
        // 增加覆盖按钮
        CGRect totalRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(0, self.attrStr.string.length) inTextContainer:self.container];
        CGRect lastCharRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(range.length - 1, 1) inTextContainer:self.container];
        NSUInteger index = range.length - 1;
        char lastcharset = [self.attrStr.string characterAtIndex:index];
        BOOL changeLine = false;
        if(lastcharset == '\n' || lastcharset == '\r') {
            changeLine = true;
        }
        CGFloat x = lastCharRect.origin.x;
        CGFloat y = lastCharRect.origin.y + self.textView.textContainerInset.top - 1;
        CGFloat width = lastCharRect.size.width;
        
        CGFloat coverX = 0;
        CGFloat coverY = 0;
        CGFloat coverWidth = 0;
        CGFloat coverHeight = 0;
        
        CGSize btnsize = self.coverView.btnsize;
        if(changeLine) {
            // 位于 x 后面   宽度到末尾
            if(width > btnsize.width) {
                // 不用裁剪
                coverX = x;
                coverY = y;
                coverWidth = self.textView.frame.size.width- x;
                coverHeight = btnsize.height;
            }else {
                // 裁剪
                coverX = totalRect.size.width - btnsize.width;
                coverWidth = self.textView.frame.size.width - coverX;
                coverHeight = btnsize.height;
                coverY = y;
            }
        }else {
            // 位于末尾   宽度是按钮宽度
            NSInteger offsetIndex = 0;
            if(width > 0) {
                offsetIndex = (NSInteger)( btnsize.width / width + 0.5);
            }
            NSInteger index = range.length - offsetIndex;
            if(index > 0 && index < range.length) {
                CGRect beginRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(index, 1) inTextContainer:self.container];
                coverX = beginRect.origin.x + width / 4 - 3;
                coverY = beginRect.origin.y + self.textView.textContainerInset.top - 1;
                coverWidth = self.textView.frame.size.width - coverX;
                coverHeight = btnsize.height;
            }
           
        }
        CGRect rect = CGRectMake(coverX, coverY, coverWidth, coverHeight);
        CGRect outRect = [self.textView convertRect:rect toView:self];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:outRect];
        self.orignPath = path;
        self.container.exclusionPaths = @[path];
        self.coverView.frame = outRect;
    }
}

- (void)addPackupviewIfNeededWithSize:(CGSize)size packupsize:(CGSize)packupSize{
    if(!self.showPackupBtn) {
        return;
    }
    // 添加收起按钮不用换行的情况
    CGFloat coverX = 0;
    CGFloat coverY = 0;
    CGFloat coverWidth = 0;
    CGFloat coverHeight = 0;
    
    NSUInteger index = self.attrStr.string.length - 1;
    char lastcharset = [self.attrStr.string characterAtIndex:index];
    BOOL changeLine = false;
    if(lastcharset == '\n' || lastcharset == '\r') {
        changeLine = true;
    }
    
    if(size.height == packupSize.height) {
        CGRect lastCharRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(self.attrStr.string.length-1, 1) inTextContainer:self.container];
        if(!changeLine) {
            coverX = lastCharRect.origin.x + lastCharRect.size.width;
            coverY = lastCharRect.origin.y + self.textView.textContainerInset.top ;
            coverWidth = self.textView.frame.size.width - coverX;
            coverHeight = lastCharRect.size.height;
        }else {
            // 最后一个是换行符的情况
            coverX = self.textView.textContainerInset.left;
            coverY = lastCharRect.origin.y + self.textView.textContainerInset.top + lastCharRect.size.height;
            coverWidth = self.textView.frame.size.width;
            coverHeight = lastCharRect.size.height;
        }
    }else if(packupSize.height > size.height) {
        // 需要换行的情况
        CGRect lastCharRect = [self.layoutManager boundingRectForGlyphRange:NSMakeRange(self.attrStr.string.length-1, 1) inTextContainer:self.container];
        coverX = self.textView.textContainerInset.left;
        coverHeight = lastCharRect.size.height;
        coverWidth = self.textView.frame.size.width;
        coverY = lastCharRect.size.height + lastCharRect.origin.y + self.textView.textContainerInset.top;
    }
    CGRect packupRect = [self.textView convertRect:CGRectMake(coverX, coverY, coverWidth, coverHeight) toView:self];
    self.packUpView.frame = packupRect;
    [self addSubview:self.packUpView];
}

- (void)coverClick {
    //自身frame变大  coverview移除  textviewsize 变大  添加收起按钮
    NSLog(@"展开点击");
    CGSize size = [self attrSizeWithAttr:self.attrStr caculateSize:CGSizeMake(self.textView.frame.size.width, MAXFLOAT)];
    CGSize packupsize = [self attrSizeWithAttr:self.attrStr packupAttr:self.packUpBtnAttr caculateSize:CGSizeMake(self.textView.frame.size.width, MAXFLOAT)];
    if(!self.showPackupBtn) {
        packupsize = size;
    }
    self.addPackupSize = packupsize;
    [self.coverView removeFromSuperview];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.frame.size.width, packupsize.height + self.textView.textContainerInset.top + self.textView.textContainerInset.bottom);
    self.container.size = packupsize;
    self.container.exclusionPaths = @[];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,self.textView.frame.size.width, self.textView.frame.size.height);
    if([self.delegate respondsToSelector:@selector(sizeChangeWithSize:)]) {
        [self.delegate sizeChangeWithSize:packupsize];
    }
    // 添加按钮
    [self addPackupviewIfNeededWithSize:size packupsize:packupsize];
    
}

- (void)packupClick {
    // 变回原有的frame  添加coverview  textviewsize变回原来大小  移除packupview
    NSLog(@"收起点击");
    [self.packUpView removeFromSuperview];
    [self addSubview:self.coverView];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.orignFrame.size.width, self.orignFrame.size.height);
    self.container.size = self.orignFrame.size;
    self.frame = self.orignFrame;
    self.container.exclusionPaths = @[self.orignPath];
    if([self.delegate respondsToSelector:@selector(sizeChangeWithSize:)]) {
        [self.delegate sizeChangeWithSize:self.orignFrame.size];
    }
}

- (CoverView *)coverView {
    if(!_coverView) {
        _coverView = [[CoverView alloc] init];
        __weak typeof(&*self) weakself = self;
        _coverView.clickBlock = ^{
            [weakself coverClick];
        };
    }
    return _coverView;
}

- (CoverView *)packUpView {
    if(!_packUpView) {
        _packUpView = [[CoverView alloc] init];
        __weak typeof (&*self)weakself = self;
        _packUpView.clickBlock = ^{
            [weakself packupClick];
        };
    }
    return _packUpView;
}


- (CGSize)attrSizeWithAttr:(NSAttributedString *)attrStr caculateSize:(CGSize)caculateSize {
    if(attrStr.string.length) {
        CGSize size = [attrStr boundingRectWithSize:caculateSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        return CGSizeMake(size.width + 2, size.height + 2);
    }
    return CGSizeZero;
}

- (CGSize)attrSizeWithAttr:(NSAttributedString *)attrStr packupAttr:(NSAttributedString *)packupAttr caculateSize:(CGSize)caculateSize {
    if(attrStr.string.length && packupAttr.string.length) {
        NSMutableAttributedString *mAttrstr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
        [mAttrstr appendAttributedString:packupAttr];
        return [self attrSizeWithAttr:[mAttrstr copy] caculateSize:caculateSize];
    }
  
    return [self attrSizeWithAttr:attrStr caculateSize:caculateSize];
}

@end
