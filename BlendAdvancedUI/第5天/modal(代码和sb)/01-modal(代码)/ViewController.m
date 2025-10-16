//
//  ViewController.m
//  01-modal(代码)
//
//  Created by Romeo on 15/12/5.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


// 代码跳转到modal
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 跳转到 testviewcontroller

    TestViewController* vc = [[TestViewController alloc] init];

    // 加特技!!! 这是一个枚举
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    // 以 modal 的形式跳转
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         NSLog(@"跳转完成");
                     }];
}

@end
