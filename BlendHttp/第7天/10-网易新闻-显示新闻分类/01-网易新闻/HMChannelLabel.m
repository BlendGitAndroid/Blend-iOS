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


@end
