//
//  ViewController.m
//  11-获取裁剪过后的图片
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView* imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{

    // 3.获取图片
    UIImage* image = [UIImage imageNamed:@"me"];

    // 1.开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    // 5.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 4.画一个裁剪的图片
    CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5, 0, 2 * M_PI, 1);

    // 6.裁剪
    CGContextClip(ctx);

    // 7.把图片画上去
    // CGPointZero 是一个CGPoint结构体常量，等价于 CGPointMake(0, 0) ，表示二维坐标系中的原点位置。
    [image drawAtPoint:CGPointZero];

    // 8.取出来
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

    // 2.关闭图片类型的图形上下文
    UIGraphicsEndImageContext();

    // 测试
    self.imageView.image = newImage;
}

@end
