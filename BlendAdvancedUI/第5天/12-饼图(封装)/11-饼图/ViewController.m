//
//  ViewController.m
//  11-饼图
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "PieView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    PieView* pie = [PieView pieView];
       pie.frame = CGRectMake(0, 0, 200, 100);

    [self.view addSubview:pie];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
