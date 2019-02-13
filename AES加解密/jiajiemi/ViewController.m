//
//  ViewController.m
//  jiajiemi
//
//  Created by Abe on 2017/8/3.
//  Copyright © 2017年 heimavista. All rights reserved.
//

#import "ViewController.h"
#import "AES.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *aesKey = @"qaswedfr";
    
    NSString *name = @"123456我是";
    NSString *other = @"123456我是";
    
    NSString *jiamiName = [AES encrypt:name password:aesKey];
    NSString *sameName = [AES encrypt:other password:aesKey];
    NSLog(@"%@", jiamiName);
    NSLog(@"%@", sameName);
    
    NSString *jiemiName = [AES decrypt:jiamiName password:aesKey];
    NSLog(@"%@", jiemiName);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
