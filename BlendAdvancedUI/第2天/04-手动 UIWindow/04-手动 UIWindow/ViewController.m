//
//  ViewController.m
//  04-手动 UIWindow
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)addWindowBtnClick:(UIButton *)sender {
    
    // 创建一个红色的 window
    UIWindow *redW = [[UIWindow alloc] initWithFrame:CGRectMake(20, 60, 200, 200)];
    redW.backgroundColor = [UIColor redColor];
    
    // 将window显示出来
    redW.hidden = NO;
    
    [self.view addSubview:redW];
    
    // 创建一个按钮，添加到红色的 window 中，点击后调用 btnClick 方法
    // 这是一个标准的iOS加号按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    // 设置按钮的位置
    btn.center = redW.center;
    
    // 给按钮添加点击事件，通过 addTarget:action:forControlEvents: 方法，为按钮添加点击事件处理器，当用户点击按钮并抬起手指时，会调用当前控制器的 btnClick 方法
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [redW addSubview:btn];
    
    
    // 什么时候会用到 window ?
    
    // 对第三方框架,用的比较多,尤其是那种提示类的框架,会用到,主要提示用户耐心等耐加载完成.
    
    // 有时候有的框架,
//    [[UIApplication sharedApplication].keyWindow addSubview:customWindow];
//    [[[UIApplication sharedApplication].windows lastObject] addSubview:customWindow];
    
}

- (void)btnClick {

    NSLog(@"点了加号按钮");
}

@end
