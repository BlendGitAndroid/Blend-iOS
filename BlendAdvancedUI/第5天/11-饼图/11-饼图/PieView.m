//
//  PieView.m
//  11-饼图
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "PieView.h"

@implementation PieView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    NSArray* array = @[ @0.3, @0.1, @0.4, @0.2 ];

    CGFloat start = 0;
    CGFloat end = 0;

    for (int i = 0; i < array.count; ++i) {

        end = 2 * M_PI * [array[i] floatValue] + start;

        UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:start endAngle:end clockwise:YES];
        // 画扇形的时候 记得往圆心 连一条线
        [path addLineToPoint:CGPointMake(150, 150)];
        // 设置随机颜色
        [[self randomColor] set];

        [path fill];
        start = end;
    }
}

// 随机颜色
- (UIColor*)randomColor
{
    CGFloat r = arc4random() % 255 / 256.0;
    CGFloat g = arc4random() % 255 / 256.0;
    CGFloat b = arc4random() % 255 / 256.0;

    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// 点view就会执行
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    // 重绘
    //    [self setNeedsDisplay];
    // 重绘指定的区域
    [self setNeedsDisplayInRect:CGRectMake(0, 0, 300, 150)];
}

@end
