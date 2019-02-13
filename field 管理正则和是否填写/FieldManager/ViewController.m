//
//  ViewController.m
//  FieldManager
//
//  Created by Abe on 2018/3/16.
//  Copyright © 2018年 heimavista. All rights reserved.
//

// 管理 监听field 的正则是否规则  字数限制  还有是否被填写了

// demo
#import "ViewController.h"
#import "FieldWriteManager.h"
#import "NSRegularExpression+HVMarsFactoryExtension.h"

@interface ViewController ()
@property (strong, nonatomic) UITextField *field1;
@property (strong, nonatomic) UITextField *field2;
@property (strong, nonatomic) UITextField *field3;
@property (strong, nonatomic) UITextField *field4;
@property (strong, nonatomic) FieldWriteManager *manager;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [[FieldWriteManager alloc] initWithtipview:self.view];
    self.field1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    self.field1.backgroundColor = [UIColor yellowColor];
    self.field2 = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
    self.field2.backgroundColor = [UIColor yellowColor];
    self.field3 = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 30)];
    self.field3.backgroundColor = [UIColor yellowColor];
    self.field4 = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, 200, 30)];
    self.field4.backgroundColor = [UIColor yellowColor];

    UIButton *sendbtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 100, 30)];
    [sendbtn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    sendbtn.backgroundColor =  [UIColor greenColor];

    [self.view addSubview:self.field1];
    [self.view addSubview:self.field2];
    [self.view addSubview:self.field3];
    [self.view addSubview:self.field4];
    [self.view addSubview:sendbtn];


    [self.field1 addEmptyListenWithTip:@"field1 不能为空"];
    [self.field2 addEmptyListenWithTip:@"field2 不能为空"];
    [self.field3 addEmptyListenWithTip:@"field3 不能为空"];
    [self.field4 addEmptyListenWithTip:@"field4 不能为空"];
    [self.manager addFields:@[self.field1, self.field2, self.field3, self.field4]];

    [self.field1 addRegularListenWithTip:@"field1 格式不对" expression:[NSRegularExpression phoneRegularExpression]];
    [self.field3 addRegularListenWithTip:@"field3 格式不对" expression:[NSRegularExpression phoneRegularExpression]];
    [self.manager addRegularFields:@[self.field1, self.field3, self.field4]];
}

- (void)btnclick:(UIButton *)btn {
    if([self.manager isAllWrite] && [self.manager isAllRegular]) {
         NSLog(@"has writed");
    }


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
