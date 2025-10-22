//
//  HMView.m
//  04-绘图的方式
//
//  Created by Romeo on 15/12/5.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // 上下文栈机制： 从代码中可以看到 CGContextSaveGState 和 CGContextRestoreGState 的使用，这是上下文栈的典型操作，允许我们：

// 1. 1.
//    保存当前绘图状态到栈中
// 2. 2.
//    修改绘图属性进行绘制
// 3. 3.
//    恢复之前的状态，不影响后续绘制

    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 备份
    CGContextSaveGState(ctx);

    // 2.拼接路径 同时 把路径添加到上下文当中
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, 1);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);

    CGContextSetLineWidth(ctx, 10);

    // 第二次备份
    CGContextSaveGState(ctx);

    [[UIColor redColor] set];

    // 3.渲染
    CGContextStrokePath(ctx);

    // 拼接路径
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 250, 20);

    // 恢复
    CGContextRestoreGState(ctx);

    // 渲染
    CGContextStrokePath(ctx);
}

@end
