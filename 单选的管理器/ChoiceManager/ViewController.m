//
//  ViewController.m
//  OneChoiceManager
//
//  Created by Abe on 2017/9/1.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "ViewController.h"
#import "OneChoiceManager.h"
#import "UILabel+HVKRTZlLblExtension.h"
#import "IconLabel.h"
#import "UIView+ZLFrameExtension.h"

@interface ViewController ()<ChoiceViewProtocol>
@property (nonatomic, strong) OneChoiceManager *manager;
@property (strong, nonatomic) UILabel *lbl;
@property (strong, nonatomic) IconLabel *iconLbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.lbl = [UILabel zl_CreateWithStr:@"我是已给哥哥IE共轭你搜的公司第弄个ISO等给你单身狗is等给你冻死大过年的死哦给你单身狗is的 " font:[UIFont systemFontOfSize:14] textColor:[UIColor blackColor]];
//    self.lbl.backgroundColor = [UIColor redColor];
    self.iconLbl = [[IconLabel alloc] initWithIcon:[UIImage imageNamed:@"icon1"] label:self.lbl];
    self.iconLbl.icononright = YES;
    self.iconLbl.iconSize = CGSizeMake(20, 20);
    self.iconLbl.iconLblMargin = 10;
    
    [self.view addSubview:self.iconLbl];
    
    self.manager = [[OneChoiceManager alloc] init];
    self.manager.choiceDelegate = self;
    
    NSMutableArray *btns = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30+50*i, 100, 40, 40)];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor yellowColor];
        [btns addObject:btn];
        [self.view addSubview:btn];
        
    }
    self.manager.itemViews = btns;
    [self.manager selectedIndex:0];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.iconLbl.x = 50;
    self.iconLbl.y = 200;
    self.iconLbl.size = [self.iconLbl sizeThatFits:CGSizeMake(200, 50)];
    [self.iconLbl setNeedsLayout];
    [self.iconLbl layoutIfNeeded];
    
}

- (void)btnclick:(UIButton *)btn {
    [self.manager selectedView:btn];
}

- (void)selectedView:(__kindof UIView *)view preSelectedView:(__kindof UIView *)preView {
    view.backgroundColor = [UIColor redColor];
    preView.backgroundColor = [UIColor yellowColor];
}

- (void)viewUnselected:(__kindof UIView *)view {
    view.backgroundColor = [UIColor yellowColor];
}

- (void)repeatSelectedView:(UIView *)selectedView {
    // 处理 相同的view点击时候的事件
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
