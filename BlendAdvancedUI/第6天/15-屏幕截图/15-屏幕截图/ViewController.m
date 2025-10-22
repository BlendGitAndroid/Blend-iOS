//
//  ViewController.m
//  15-屏幕截图
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\

    // 开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);

    // 获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 截图 把view 的内容 放到上下文中 然后 渲染
    [self.view.layer renderInContext:ctx];

    // 取图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();

    // 关闭上下文
    UIGraphicsEndImageContext();

    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
