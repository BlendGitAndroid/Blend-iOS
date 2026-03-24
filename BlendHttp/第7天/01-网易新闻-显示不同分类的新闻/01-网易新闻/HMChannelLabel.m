//
//  HMChannelLabel.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#define kBIGFONT 18
#define kSMALLFONT 14
#import "HMChannelLabel.h"

@implementation HMChannelLabel

+ (instancetype)channelLabelWithTName:(NSString *)tname {
    HMChannelLabel *lbl = [self new];
    lbl.text = tname;
    lbl.textAlignment = NSTextAlignmentCenter;
    //让label的大小和大字体一样
    lbl.font = [UIFont systemFontOfSize:kBIGFONT];
    [lbl sizeToFit];
    
    //
    lbl.font = [UIFont systemFontOfSize:kSMALLFONT];
    return lbl;
}

//根据比例改变文字的大小
- (void)setScale:(CGFloat)scale {
    CGFloat max = kBIGFONT * 1.0 / kSMALLFONT - 1;
    
    self.transform = CGAffineTransformMakeScale( max*scale+1, max*scale+1);
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}

@end
