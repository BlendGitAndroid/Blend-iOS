//
//  BarView.m
//  14-柱状图
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "BarView.h"

@implementation BarView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    NSArray* array = @[ @0.2, @0.7, @0.8, @0.1, @1, @0.5 ];

    for (int i = 0; i < array.count; ++i) {
        CGFloat w = 30;
        CGFloat h = self.bounds.size.height * [array[i] floatValue];
        CGFloat y = self.bounds.size.height - h;
        CGFloat x = i * 2 * w;
        UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [path fill];
    }
}

@end
