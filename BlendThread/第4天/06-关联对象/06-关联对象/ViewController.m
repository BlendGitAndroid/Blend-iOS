//
//  ViewController.m
//  06-关联对象
//
//  Created by Apple on 15/10/17.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+MyView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImageView *imgView = [UIImageView new];

    imgView.urlString = @"123abc";

    NSLog(@"%@", imgView.urlString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
