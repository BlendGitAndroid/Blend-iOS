//
//  ViewController.m
//  10-应用程序对象介绍
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)btnClick:(UIButton *)sender {
/**
 1. UIApplication 类型的对象 主要是执行应用级别的操作
 2. 应用程序对象的获取 [UIApplication sharedApplication]
 */
    UIApplication *app = [UIApplication sharedApplication];
    
    // keyWindow
//    app.keyWindow; 应用之所以能够显示就是因为他的存在
//    app.windows; 应用程序里面所有的可见不可见的window;
    
}









@end
