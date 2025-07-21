//
//  ViewController.m
//  003喜马拉雅案例
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *lastImgView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *sandBox = NSHomeDirectory();
    NSLog(@"%@", sandBox);
    
    CGFloat maxH = CGRectGetMaxY(self.lastImgView.frame);
    
    // 设置UIScrollView的contentSize
    self.scrollView.contentSize = CGSizeMake(0, maxH);
    
    
    // 设置默认滚动位置
    self.scrollView.contentOffset = CGPointMake(0, -74);
    
    
    // 设置距离上面的始终有74的内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(74, 0, 54, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
