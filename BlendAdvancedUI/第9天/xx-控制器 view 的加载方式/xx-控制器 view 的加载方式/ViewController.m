//
//  ViewController.m
//  xx-控制器 view 的加载方式
//
//  Created by Romeo on 15/12/11.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


// - loadView是view的"创建者"，viewDidLoad是view的"配置者"
// - 如果重写loadView但没有设置self.view，会导致viewDidLoad中无法访问self.view
// 如果重写了 loadView 方法，那么默认的xib或storyboard加载机制将 不会生效 。
// - 当您重写 loadView 方法时，您完全替换了UIViewController的默认view创建逻辑
// - 系统不再尝试从xib文件或storyboard中加载视图
// - 控制器的view完全由您在 loadView 中的实现来决定
// 重写控制器的 view
- (void)loadView
{
    //    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //    self.view.backgroundColor = [UIColor redColor];

    NSLog(@"loadView11");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad11");

//    [self.view addSubview:[[UISwitch alloc] init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
