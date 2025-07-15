//
//  NSString+itcast.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "NSString+itcast.h"

@implementation NSString (itcast)
//求当前这个字符串对象中有多少个阿拉伯数字.
- (int)numberCount
{
    //1. 遍历当前字符串对象中的每1个字符
    int count = 0;
    for(int i = 0; i < self.length; i++)
    {
        unichar ch = [self characterAtIndex:i]; // unichar，显示中文
        if(ch >= '0' && ch <= '9')
        {
            count++;
        }
    }
    return count;
}
@end
