//
//  ViewController.m
//  预03-UIView不接受用户交互的情况
//
//  Created by steve zhao on 15/6/9.
//  Copyright (c) 2015年 czbk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    NSLog(@"button click");
}

// 控件不能响应的情况
// 1>user interaction = no，也就是控件是否可以交互
// 2>控件隐藏
// 3>透明度小于等于0.01
// 4>子视图超出了父控件的有效范围
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.imgView addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
