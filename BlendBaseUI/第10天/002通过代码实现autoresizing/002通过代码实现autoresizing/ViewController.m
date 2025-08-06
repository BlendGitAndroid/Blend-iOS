//
//  ViewController.m
//  002通过代码实现autoresizing
//
//  Created by apple on 15/3/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnClick;

@property (nonatomic, weak) UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个蓝色View
    UIView *blueVw = [[UIView alloc] init];
    // 设置背景色
    blueVw.backgroundColor = [UIColor blueColor];
    // 设置frame
    blueVw.frame = CGRectMake(0, 0, 200, 200);
    // 把蓝色view加到控制器中
    [self.view addSubview:blueVw];
    self.blueView = blueVw;
    
    
    
    // 创建一个红色View
    UIView *redVw = [[UIView alloc] init];
    // 设置背景色
    redVw.backgroundColor = [UIColor redColor];
    // 把红色view加到蓝色view中
    [blueVw addSubview:redVw];
    
    CGFloat redW = blueVw.frame.size.width;
    CGFloat redH = 50;
    CGFloat redX = 0;
    CGFloat redY = blueVw.frame.size.height - redH;
    
    // 设置frame
    redVw.frame = CGRectMake(redX, redY, redW, redH);
    
    
    // 设置autoresizing
    // 1.设置红色View距离蓝色View的底部距离保持不变
    redVw.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    
    /*
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   距离父控件右边是固定的,
     UIViewAutoresizingFlexibleWidth        宽度随着父控件的变化而变化（表示勾选了里面的横线）
     UIViewAutoresizingFlexibleRightMargin  距离左边是固定的,
     UIViewAutoresizingFlexibleTopMargin    距离下边是固定的,
     UIViewAutoresizingFlexibleHeight       表示高度会随着父控件的高度变化而变化（勾选了里面的竖线）
     UIViewAutoresizingFlexibleBottomMargin 表示距离上边是固定的
     */
    
    // 0            0   00000000
    // 2 的 0 次方   1   00000001
    // 2 的 1 次方   2   00000010
    // 2 的 2 次方   4   00000100
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 按钮单击事件
- (IBAction)btnClick {
    // 每次增加蓝色view的高度和宽度
    CGRect blueFrame = self.blueView.frame;
    // 增加高和宽
    blueFrame.size.height += 20;
    blueFrame.size.width += 20;
    
    self.blueView.frame = blueFrame;
}
@end
