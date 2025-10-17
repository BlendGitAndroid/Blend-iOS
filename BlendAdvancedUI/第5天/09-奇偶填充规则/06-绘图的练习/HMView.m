//
//  HMView.m
//  06-绘图的练习
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    [path addArcWithCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:2 * M_PI clockwise:1];

    path.usesEvenOddFillRule = YES;

    [path fill];
}

- (void)test1
{

    // 1. 获取"图形上下文"
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];

    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:1];

    UIBezierPath* path2 = [UIBezierPath bezierPathWithRect:CGRectMake(250, 30, 20, 200)];

    CGContextAddPath(ctx, path2.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);

    // 说明: 被覆盖过奇数次的点填充, 被覆盖过偶数次的点不填充
    CGContextDrawPath(ctx, kCGPathEOFill);
}

@end