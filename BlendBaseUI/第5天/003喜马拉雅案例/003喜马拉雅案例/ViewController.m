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
    
    // NSHomeDirectory 是 iOS/macOS 开发中 Foundation 框架提供的函数，
    // 用于获取当前应用程序的沙盒主目录路径。
    // 返回的路径格式通常为： 
    // /Users/用户名/Library/Developer/CoreSimulator/Devices/
    // 设备ID/data/Containers/Data/Application/应用ID （模拟器环境）
    // 或 /var/mobile/Containers/Data/Application/应用ID （真机环境）。
    NSString *sandBox = NSHomeDirectory();
    NSLog(@"%@", sandBox);
    
    // 获取最后一个图片的最大高度
    CGFloat maxH = CGRectGetMaxY(self.lastImgView.frame);
    
    // 设置UIScrollView的contentSize
    // CGSizeMake 是 iOS 开发中用于创建 CGSize 结构体的函数，
    // 用于定义一个二维大小，通常用于表示视图的宽度和高度。 
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
