//
//  ViewController.m
//  16-自定义进度条
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ProgressView* progressView;

@end

@implementation ViewController

// slider 控件的监听
- (IBAction)slide:(UISlider*)sender
{
    // 通过value 获取当前 slider 上按钮的位置
    NSLog(@"%f", sender.value);

    // 将Slider的值给ProgressView的value
    self.progressView.values = sender.value;

    // 触发重绘
    [self.progressView setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
