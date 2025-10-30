//
//  HMRotateView.m
//  01-大转盘
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMRotateView.h"

@interface HMRotateView () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView* rotateImage; // 锯齿图片

@property (nonatomic, weak) UIButton* currentButton;

@property (nonatomic, strong) CADisplayLink* link;

@end

@implementation HMRotateView

+ (instancetype)rotateView
{
    return [[NSBundle mainBundle] loadNibNamed:@"HMRotateView" owner:nil options:nil][0];
}

// 创建12个 btn
- (void)awakeFromNib
{
    for (int i = 0; i < 12; ++i) {
        UIButton* btn = [[UIButton alloc] init];

        // 设置 tag 方便计算旋转
        btn.tag = i;

        // 获取需要设置的图片
        UIImage* image = [UIImage imageNamed:@"LuckyAstrology"];
        // 裁剪 image
        image = [self clipImageWithImage:image withIndex:i];
        // 设置图片
        [btn setImage:image forState:UIControlStateNormal];

        // 获取需要设置的图片
        UIImage* imagePress = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        // 裁剪 image
        imagePress = [self clipImageWithImage:imagePress withIndex:i];
        // 设置图片
        [btn setImage:imagePress forState:UIControlStateSelected];

        // 设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];

        // btn 内部 imageView 往上偏移
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-50, 0, 0, 0)];

        [self.rotateImage addSubview:btn];

        // 监听 btn 的点击时间
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 开始选号
- (IBAction)pickNumber:(id)sender
{

    // 如果叫 key 的核心动画不存在 那么 去做动画
    if (![self.rotateImage.layer animationForKey:@"key"]) {

        // 停止旋转
        self.link.paused = YES;

        // 核心动画-基本动画
        CABasicAnimation* anim = [[CABasicAnimation alloc] init];
        // 修改的属性
        anim.keyPath = @"transform.rotation";

        // 计算 需要减去的角度
        CGFloat angle = 2 * M_PI / 12 * self.currentButton.tag;

        // 5圈
        anim.toValue = @(5 * M_PI * 2 - angle);

        // 设置时间
        anim.duration = 3;

        // 不回到原来的位置
        anim.fillMode = kCAFillModeForwards;
        anim.removedOnCompletion = NO;

        // 把核心动画添加到 image 上
        [self.rotateImage.layer addAnimation:anim forKey:@"key"];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(anim.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 旋转到最初始的位置
            self.rotateImage.transform = CGAffineTransformMakeRotation(-angle);

            // 弹框
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"1,2,3,4,5,6,7" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];

            // 弹出来
            [alertView show];

            // 移除核心动画
            [self.rotateImage.layer removeAnimationForKey:@"key"];

        });
    }
}

// 点击"确定"
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    // 开启自旋转
    self.link.paused = NO;
}

// 开始旋转
- (void)startRotate
{
    // cadisplaylink
    CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    // 添加到主运行循环当中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}

// 旋转
- (void)rotate
{
    // 2 * mpi 一秒钟60圈
    // 2 * mpi / 60  一秒钟1圈
    // 2 * mpi / 60 / 10 十秒钟一圈

    self.rotateImage.transform = CGAffineTransformRotate(self.rotateImage.transform, 2 * M_PI / 60 / 10);
}

// 星座按钮的点击事件
- (void)btnClick:(UIButton*)sender
{
    // 把记录的按钮的选中状态取消
    self.currentButton.selected = NO;

    // 设置点击按钮选中
    sender.selected = YES;

    // 记录选中的 btn
    self.currentButton = sender;
}

// 布局子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];

    for (int i = 0; i < self.rotateImage.subviews.count; ++i) {
        // 获取 btn
        UIButton* btn = self.rotateImage.subviews[i];

        // 设置 frame
        btn.frame = CGRectMake(0, 0, 68, 143);
        //        btn.bounds = CGRectMake(0, 0, 68, 143);

        // 设置中心
        btn.center = self.rotateImage.center;

        // 锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);

        // 计算一个按钮的夹角
        CGFloat angle = 2 * M_PI / 12;
        // 修改按钮的 transform
        btn.transform = CGAffineTransformMakeRotation(angle * i);
    }
}

// 根据大图 切割出来一部分图片
- (UIImage*)clipImageWithImage:(UIImage*)image withIndex:(NSInteger)index
{
    
    // 计算rect
    // 修改宽度计算逻辑，减小缩放因子影响
    CGFloat w = image.size.width / 12 * ([UIScreen mainScreen].scale);
    CGFloat h = image.size.height * [UIScreen mainScreen].scale;
    CGFloat x = index * w;
    CGFloat y = 0;

    NSLog(@"%@", NSStringFromCGRect(CGRectMake(x, y, w, h)));

    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, w, h));

    return [[UIImage alloc] initWithCGImage:imageRef scale:2.3 orientation:UIImageOrientationUp];
}

@end
