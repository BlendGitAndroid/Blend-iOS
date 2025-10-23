//
//  BGView.m
//  03-多点触摸的案例
//
//  Created by Romeo on 15/12/8.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "BGView.h"

@interface BGView ()
@property (nonatomic, strong) NSArray* images;

@end

@implementation BGView

- (NSArray*)images
{
    if (!_images) {
        _images = @[ [UIImage imageNamed:@"spark_blue"], [UIImage imageNamed:@"spark_green"], [UIImage imageNamed:@"spark_cyan"], [UIImage imageNamed:@"spark_red"], [UIImage imageNamed:@"spark_yellow"], [UIImage imageNamed:@"spark_magenta"]];
    }
    return _images;
}

// 手指触摸这个 view 的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self addSpark:touches];
}

// 手指在这个 view 移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self addSpark:touches];
}

// 根据手指的位置 添加小星星
- (void)addSpark:(NSSet*)touches
{
    for (UITouch* t in touches) {

        // 获取 触摸对象
        //        UITouch* t = touches.anyObject;

        // 获取手指的位置
        CGPoint p = [t locationInView:t.view];
        
        // 使用 arc4random_uniform() 函数生成0到(self.images.count-1)之间的随机整数
        // rc4random_uniform() 是iOS/macOS开发中常用的一个随机数生成函数，它属于libc库中的函数，不需要额外导入头文件即可使用。
        // arc4random_uniform() 函数名称的由来与它的实现原理和功能特点有关：
        
// 1. arc4 ：
   
//    - 这部分源自"ARC4"，全称为"Alleged RC4"（所谓的RC4）
//    - RC4是一种流密码算法（Rivest Cipher 4），由Ron Rivest在1987年设计
//    - 函数内部使用了基于ARC4算法的伪随机数生成器，提供较高质量的随机性
// 2. random ：
   
//    - 直接表明这是一个随机数生成函数
//    - 区别于传统的rand()函数，提供更好的随机性
// 3. uniform ：
   
//    - 表示这个函数生成的随机数是均匀分布的
//    - 相比使用 arc4random() % max 的方式，它避免了模运算可能导致的分布不均匀问题
//    - 通过特殊算法确保在给定范围内每个数值出现的概率相等
// 这个命名清晰地传达了函数的核心特点：

// - 基于ARC4算法
// - 生成随机数
// - 保证均匀分布
        int i = arc4random_uniform((int)self.images.count);

        // 创建 imageView
        UIImageView* imageView = [[UIImageView alloc] initWithImage:self.images[i]];

        // 设置 imageView 的中心为手指的位置
        imageView.center = p;

        // 把 imageView 加到黑色 view 上
        [self addSubview:imageView];

        // 动画
        [UIView animateWithDuration:2
            animations:^{
                imageView.alpha = 0;
            }
            completion:^(BOOL finished) {
                [imageView removeFromSuperview]; // 移除控件
            }];

        i++;
    }
}
@end
