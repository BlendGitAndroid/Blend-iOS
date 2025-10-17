//
//  ProgressView.m
//  16-自定义进度条
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()

@property (weak, nonatomic) IBOutlet UILabel* label;

@end

@implementation ProgressView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    // 两个百分号等于一个百分号
    self.label.text = [NSString stringWithFormat:@"%.2f%%", self.values * 100];

    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:-M_PI_2 endAngle:2 * M_PI * self.values - M_PI_2 clockwise:YES];
    
    // 聚合原点
    [path addLineToPoint:CGPointMake(150, 150)];

    [[UIColor redColor] set];

    [path fill];
}

@end
