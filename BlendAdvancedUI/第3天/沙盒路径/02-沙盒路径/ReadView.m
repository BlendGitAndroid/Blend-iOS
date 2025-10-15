//
//  ReadView.m
//  02-沙盒路径
//
//  Created by 徐海 on 2025/10/14.
//  Copyright © 2025 heima. All rights reserved.
//

#import "ReadView.h"

@implementation ReadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // 当从xib或storyboard加载时，会调用initWithCoder方法
        NSLog(@"ReadView");
    }
    return self;
}

@end
