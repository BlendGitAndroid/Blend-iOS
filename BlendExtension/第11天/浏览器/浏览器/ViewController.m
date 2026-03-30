//
//  ViewController.m
//  浏览器
//
//  Created by dream on 15/12/25.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    
    // 如果公司没有特殊的界面制定要求, 当弹出网页的时候, 可以使用这里的SFSafariViewController
    SFSafariViewController *sf = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self presentViewController:sf animated:YES completion:nil];
}

@end
