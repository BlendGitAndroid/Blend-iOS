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

    // 1. 获取"图形上下文"
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:1];

    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:0];

    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);

    // 默认填充模式: nonzero winding number rule(非零绕数规则)从左到右跨过, +1。从右到左跨过, -1。最后如果为0, 那么不填充, 否则填充
    CGContextDrawPath(ctx, kCGPathFill);
}

@end