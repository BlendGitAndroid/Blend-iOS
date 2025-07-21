//
//  ViewController.m
//  005实现图片缩放
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

// 实现缩放方法, 在这个方法中返回要进行缩放的子控件（这个方法在缩放前就会被调用）
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"=========viewForZoomingInScrollView=========");
    return self.imgView;
}

// 即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"scrollViewWillBeginZooming");
}

// 正在缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidZoom");
}

// 缩放完毕
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"scrollViewDidEndZooming");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置UIScrollView的缩放比例
    self.scrollView.maximumZoomScale = 3.5; // 最大放大到3.5倍
    self.scrollView.minimumZoomScale = 0.5; // 最小缩小到0.5倍
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
