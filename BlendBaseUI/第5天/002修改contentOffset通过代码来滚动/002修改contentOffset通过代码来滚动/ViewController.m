//
//  ViewController.m
//  002修改contentOffset通过代码来滚动
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)scroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置UIScrollView的实际内容大小
    self.scrollView.contentSize = self.imgView.image.size;
    
    // 隐藏滚动指示器
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // 设置UIScrollView的内容的内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 50, 30, 5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 通过代码来让图片滚动
- (IBAction)scroll {
    CGPoint point = self.scrollView.contentOffset;
    point.x += 150;
    point.y += 150;
    
    // 直接修改contentOffset, 没有动画效果
    // self.scrollView.contentOffset = point;
    
    
//    // 通过block动画实现滚动
//    [UIView animateWithDuration:1.0 animations:^{
//        self.scrollView.contentOffset = point;
//    }];
    
    
    
    // 直接使用动画的方式来设置contentOffset属性的值
    [self.scrollView setContentOffset:point animated:YES];
    
}
@end
