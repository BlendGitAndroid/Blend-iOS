//
//  ViewController.m
//  05-摇一摇
//
//  Created by dream on 15/12/22.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 摇一摇在iOS中的2种实现方式
    //1. 加速计的值 --> 默认不动手机,1~-1 , 如果摇动了手机, 值会增大
    //可以取绝对值, 自行判断(譬如, 值大于5, 就认为是动摇了)
    
    //2. 系统已经封装号的摇动方法
    
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇一摇");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"取消摇动");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇动结束");
}

@end
