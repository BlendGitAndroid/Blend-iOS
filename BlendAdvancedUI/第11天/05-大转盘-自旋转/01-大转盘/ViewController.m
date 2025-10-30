//
//  ViewController.m
//  01-大转盘
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 ;. All rights reserved.
//

#import "ViewController.h"
#import "HMRotateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 设置控制器 view 背景图片(拉伸)
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"LuckyBackground"].CGImage;

    // 创建这个旋转的 view
    HMRotateView* rotateView = [HMRotateView rotateView];

    // 设置中心
    rotateView.center = self.view.center;

    // 添加到控制器的 view 上
    [self.view addSubview:rotateView];

    // 旋转
    [rotateView startRotate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
