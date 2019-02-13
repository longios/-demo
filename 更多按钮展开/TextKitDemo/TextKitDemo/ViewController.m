//
//  ViewController.m
//  TextKitDemo
//
//  Created by Abe on 2018/6/20.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import "ViewController.h"
#import "UILbLBtn.h"
#import "MoreTextLbl.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (strong, nonatomic) UITextView *textView;
//@property (strong, nonatomic) UIButton *moreBtn;
@property (strong, nonatomic) NSTextContainer *container;
@property (strong, nonatomic) UITextView *normalTextView;
@property (strong, nonatomic) NSAttributedString *attrStr;
@property (strong, nonatomic) UILbLBtn *lblBtn;
@property (assign, nonatomic) CGFloat lineHeight;
@property (strong, nonatomic) UILabel *normalLbl;
@property (strong, nonatomic) MoreTextLbl *moreTextLbl;
@end

@implementation ViewController
{
    NSTextStorage *storage;
    NSLayoutManager *layoutManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.lbl];
    // Do any additional setup after loading the view, typically from a nib.
    storage = [[NSTextStorage alloc] init];
    // 寒假\n
    NSMutableAttributedString *mattrStr = [[NSMutableAttributedString alloc] initWithString:@"第三方扣水电费史蒂芬霍金可视电话货到\n付款第四节还分开交电话费好的开始放寒假的康师傅会计师电话费就客户放假多喝1水开发滑动时间和科技大会上付款好几款还记得付款是的发的说法是123的发的说法是的说法是123的"];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    [mattrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSParagraphStyleAttributeName:paragraph} range:NSMakeRange(0, mattrStr.string.length)];
    self.attrStr = [mattrStr copy];
    
    NSMutableAttributedString *btnStr = [[NSMutableAttributedString alloc] initWithString:@"......展开"];
    [btnStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSParagraphStyleAttributeName:paragraph, NSForegroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(0, btnStr.string.length)];
    
    NSMutableAttributedString *packupStr = [[NSMutableAttributedString alloc] initWithString:@"......收起"];
    [packupStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSParagraphStyleAttributeName:paragraph, NSForegroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(0, packupStr.string.length)];
    
    self.moreTextLbl = [[MoreTextLbl alloc] initWithFrame:CGRectMake(40, 50, 200, 80)];
    [self.view addSubview:self.moreTextLbl];
//    [self.moreTextLbl setWithAttrStr:mattrStr moreBtnAttrStr:btnStr];
    [self.moreTextLbl setWithAttrStr:mattrStr moreBtnAttrStr:btnStr packupStr:packupStr];
    
    
//    self.normalLbl.attributedText = self.attrStr;
//    [self.view addSubview:self.normalLbl];
    
    
    
//    [storage replaceCharactersInRange:NSMakeRange(0, 0) withAttributedString:mattrStr];
//
//
//    self.normalTextView.attributedText = mattrStr;
//    CGSize size = [self attrSizeWithAttr:mattrStr caculateSize:CGSizeMake(ScreenWidth, MAXFLOAT)];
//    self.normalTextView.frame = CGRectMake(self.normalTextView.frame.origin.x, self.normalTextView.frame.origin.y, ScreenWidth, size.height);
//    NSLayoutManager *normalLayoutManager = self.normalTextView.layoutManager;
//
//    NSRange normalrange = [normalLayoutManager glyphRangeForBoundingRect:self.normalTextView.frame   inTextContainer:self.normalTextView.textContainer];
    
    
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    [mattrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mattrStr.string.length)];
    
//    layoutManager = [[NSLayoutManager alloc] init];
//    [layoutManager setTextStorage:storage];
//    [storage addLayoutManager:layoutManager];
    
//    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeMake(ScreenWidth, 44)];
////    container.lineFragmentPadding = 0;
////    container.lineBreakMode = NSLineBreakByTruncatingTail;
////    container.maximumNumberOfLines = 2;
//    self.container = container;
//    [layoutManager addTextContainer:container];
//
//    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 44) textContainer:container];
//    self.textView.backgroundColor = [UIColor yellowColor];
    
    
//    [self.view addSubview:self.textView];
////    [self.view addSubview:self.moreBtn];
//    [self.view addSubview:self.normalTextView];
//    [self.view addSubview:self.lblBtn];
    
//    CGRect oneChar = [layoutManager boundingRectForGlyphRange:NSMakeRange(0, 1) inTextContainer:container];
//    self.lineHeight = oneChar.size.height;
    
//    [self.moreBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.lblBtn addClickBlock:^{
//        [self btnClick];
//    }];
    
    
    // 判断是否需要添加展开按钮
//
//    NSUInteger unlaidIndex = [layoutManager firstUnlaidGlyphIndex];
//    NSUInteger unlaidChacter = [layoutManager firstUnlaidCharacterIndex];
//
//    NSRange range = [layoutManager glyphRangeForTextContainer:self.container];
//
//    if(range.length < mattrStr.length) {
//        [self addBtnToTextView];
//    }
//
//
//    NSLog(@"");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSUInteger num = [layoutManager numberOfGlyphs];
    NSLog(@"%ld", num);
    BOOL right = [layoutManager isValidGlyphIndex:num-1];
    if(right) {
        NSLog(@"right");
    }else {
        NSLog(@"false");
    }
    
    
    CGRect extraRect = [layoutManager extraLineFragmentRect];
    
    NSUInteger unlaidIndex = [layoutManager firstUnlaidGlyphIndex];
    
    CGRect rect = [layoutManager boundingRectForGlyphRange:NSMakeRange(0, num) inTextContainer:self.container];
    
    CGRect usedRect = [layoutManager usedRectForTextContainer:layoutManager.textContainers.firstObject];
    
    NSLog(@"");
}

- (void)btnClick {
//    NSLog(@"show more btn click");
    
    CGFloat emptyWidth = self.textView.textContainerInset.left + self.textView.textContainerInset.right;
    
    CGSize size = [self attrSizeWithAttr:self.attrStr caculateSize:CGSizeMake(ScreenWidth-emptyWidth , MAXFLOAT)];
    self.container.size = size;
    
    CGRect fullRect = [layoutManager boundingRectForGlyphRange:NSMakeRange(0, self.attrStr.length) inTextContainer:_container];
    CGFloat padding = self.container.lineFragmentPadding * 2;
    
    
    self.container.exclusionPaths = @[];
//    [self.moreBtn removeFromSuperview];
    [self.lblBtn removeFromSuperview];
//    [self.textView  removeFromSuperview];
//    self.textView = [[UITextView alloc] initWithFrame: CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, size.width, size.height) textContainer:self.container];
//    [self.view addSubview:self.textView];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, size.width, size.height);
    self.textView.userInteractionEnabled = NO;
//    [self.textView container]
    
    
    NSRange range = [layoutManager glyphRangeForTextContainer:self.container];
    
    NSLog(@"");
}

// 将btn 展示到textview 中
- (void)addBtnToTextView {
    // 判断是否展示   展开按钮
    CGSize btnsize = self.lblBtn.frame.size;
    NSRange range = [layoutManager glyphRangeForTextContainer:self.container];
    NSUInteger index = range.length - 1;
    char lastCharset = [self.attrStr.string characterAtIndex:index];
    BOOL changeLine = lastCharset == '\n';
    
    CGRect rect = [layoutManager boundingRectForGlyphRange:NSMakeRange((range.length-1), 1) inTextContainer:self.container];
    
    CGRect totalRect = [layoutManager boundingRectForGlyphRange:NSMakeRange(0, range.length) inTextContainer:self.container];
//    CGRect rect2 = [layoutManager boundingRectForGlyphRange:NSMakeRange(range.length - 2, 1) inTextContainer:self.container];
    
    CGFloat x = rect.origin.x + rect.size.width + 3;
//    CGFloat y = rect.origin.y ;
    CGFloat y = self.textView.frame.size.height - btnsize.height - 2;
    
    if(x > (totalRect.size.width - btnsize.width) ) {
        x = totalRect.size.width - btnsize.width;
    }
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y , btnsize.width, btnsize.height)];
    
    // 在末尾的时候才需要 加这个   否则应该是\n 被截取
    if(!changeLine || rect.size.width < btnsize.width) {
         self.container.exclusionPaths = @[path];
    }else {
        if(rect.size.width > btnsize.width) {
            x = rect.origin.x + 3;
        }
    }
   
    
    CGRect btnframe = [self.textView convertRect:CGRectMake(x, y , btnsize.width, btnsize.height) toView:self.view];
    
    self.lblBtn.frame = btnframe;
}

- (UILbLBtn *)lblBtn {
    if(!_lblBtn) {
        _lblBtn = [[UILbLBtn alloc] init];
        _lblBtn.backgroundColor = [UIColor greenColor];
        _lblBtn.text = @"...展开";
        _lblBtn.textColor = [UIColor redColor];
        _lblBtn.font = [UIFont systemFontOfSize:16];
        [_lblBtn sizeToFit];
        _lblBtn.userInteractionEnabled = YES;
    }
    return _lblBtn;
}

- (UITextView *)normalTextView {
    if(!_normalTextView) {
//        _normalTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, ScreenWidth, 50)];
    }
    return _normalTextView;
}

- (UILabel *)normalLbl {
    if(!_normalLbl) {
        _normalLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, ScreenWidth, 100)];
        _normalLbl.numberOfLines = 0;
        _normalLbl.backgroundColor = [UIColor yellowColor];
    }
    return _normalLbl;
}


- (void)testTextKit {
//    NSTextStorage
    
}

- (CGSize)attrSizeWithAttr:(NSAttributedString *)attrStr caculateSize:(CGSize)caculateSize {
    NSArray *ary = [attrStr.string componentsSeparatedByString:@"\n"];
    NSArray *rAry = [attrStr.string componentsSeparatedByString:@"\r"];
    NSInteger lineNum = ary.count + rAry.count - 2;
    CGSize size = [attrStr boundingRectWithSize:caculateSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
//    size.height = lineNum * self.lineHeight + size.height;
    return size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
