//
//  ViewController.m
//  012通过约束执行动画
//
//  Created by apple on 15/3/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)btnClick;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewTopConstraint;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 按钮的单击事件
- (IBAction)btnClick {
    self.viewTopConstraint.constant += 100;

    
//    / NSLog(@"-----");
    // 通过动画的方式
    [UIView animateWithDuration:1.5 animations:^{
        [self.myView layoutIfNeeded];
    }];
  
}
@end
