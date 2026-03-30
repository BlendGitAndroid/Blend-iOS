//
//  ViewController.m
//  UIStackView
//
//  Created by dream on 15/12/25.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = self.stackView.arrangedSubviews[0];
    label.text = @"123";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
