//
//  NSNotificationListener.h
//  003通知的发布与监听
//
//  Created by apple on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

// 通知的监听者
@interface NSNotificationListener : NSObject

// 通知监听者的名称
@property (nonatomic, copy) NSString *name;

// 编写一个方法, 这个方法用来监听通知
- (void)m1:(NSNotification *)noteInfo;
@end
