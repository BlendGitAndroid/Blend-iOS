//
//  TestViewController.m
//  01-modal(代码)
//
//  Created by Romeo on 15/12/5.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{

    // 关闭
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"已经关闭");
                             }];
}

@end
