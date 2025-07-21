//
//  ViewController.m
//  03控件的常见熟悉
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt1;

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

- (IBAction)show:(id)sender {
    
//    // 获取当前控制器所管理的view下的所有子控件
//
//    // subviews表示获取某个控件的所有子控件
//    for (UIView *view in self.view.subviews) {
//        view.backgroundColor = [UIColor redColor];
//    }
    
    //self.txt1.superview.backgroundColor = [UIColor yellowColor];

    
    
//////    // 根据tag来获取某个控件
//   UITextField *txt = (UITextField *)[self.view viewWithTag:1000];
//    
//    txt.text = @"传智播客";
    
    while (self.view.subviews.firstObject) {
        [self.view.subviews.firstObject removeFromSuperview];
    }
    
    
    
    
}
@end














