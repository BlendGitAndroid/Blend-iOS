//
//  NSNotificationListener.m
//  003通知的发布与监听
//
//  Created by apple on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSNotificationListener.h"

// 通知的监听者
@implementation NSNotificationListener


- (void)m1:(NSNotification *)noteInfo
{
    //noteInfo.name; // 监听到的通知的名称
    //noteInfo.object // 监听到的通知是哪个对象发布的
    //noteInfo.userInfo // 这是一个字典, 这个字典中就包含了通知的具体内容
    NSLog(@"m1方法被执行了。");
    NSLog(@"%@", noteInfo);
    
}
//- (void)m1
//{
//    NSLog(@"duang...00");
//}

- (void)dealloc
{
    // 移出通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
