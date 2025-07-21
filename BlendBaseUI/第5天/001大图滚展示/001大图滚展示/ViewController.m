//
//  ViewController.m
//  001大图滚展示
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 告诉UIScrollView, 存在于UIScrollView里面的内容的实际大小。
    // 设置UIScrollView的内容的大小等于图片框的实际大小
    //self.scrollView.contentSize = self.imgView.frame.size;
    
    // 设置UIScrollView的内容的大小等于图片框中所显示的图片的实际大小
    self.scrollView.contentSize = self.imgView.image.size;
    NSLog(@"%@", NSStringFromCGSize(self.scrollView.contentSize));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
