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
    // 渲染的方式
    [self test1];
//    UIBezierPath* path = [UIBezierPath bezierPath];
//
//    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(200, 200)];
//    [path addLineToPoint:CGPointMake(250, 100)];
//    [path closePath];
//
//    [path setLineWidth:10];
//
//    [[UIColor redColor] setStroke];
//    [[UIColor blueColor] set];
//
//    [path stroke];
//    [path fill];
}

// c 渲染的方式
- (void)test1
{

    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 拼接路径 同时 把路径 添加到上下文中
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 250, 100);
    CGContextClosePath(ctx);

    // 设置线宽
    CGContextSetLineWidth(ctx, 10);

//    [[UIColor redColor] setStroke];

//    [[UIColor blueColor] setFill];
    
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1);
    


    // 渲染
    //    CGContextStrokePath(ctx);
    //    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);

    // CGContextDrawPath(ctx, kCGPathStroke); <==> CGContextStrokePath(ctx);
    // CGContextDrawPath(ctx, kCGPathFill); <==> CGContextFillPath(ctx);
}

@end