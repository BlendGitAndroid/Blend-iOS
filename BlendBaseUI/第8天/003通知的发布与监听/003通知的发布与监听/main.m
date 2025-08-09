//
//  main.m
//  003通知的发布与监听
//
//  Created by apple on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationSender.h"
#import "NSNotificationListener.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        // 1. 创建一个通知的发布者
        NotificationSender *sender1 = [[NotificationSender alloc] init];
        
        // 2. 创建一个通知的监听者
        NSNotificationListener *listener1 = [[NSNotificationListener alloc] init];
        
        
        // 3. 创建一个通知中心，先获取NSNotificationCenter对象，这里是一个通知中心
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
     
        // 
        // 监听一个通知
        // 参数1: 要监听通知的对象，也就是观察者
        // 参数2: 该对象的哪个方法用来监听这个通知
        // 参数3: 被监听的通知的名称
        // 参数4: 发布通知的对象，被观察者
        // 注意:
        // 1>如果没有指定参数3（或者指定参数3为nil）,但是指定了参数4为sender1, 那么表示凡是sender1对象发布的所有的通知m1方法都会监听的到。
        // 2> 如果指定了参数3(指定要监听某个通知),但是没有指定参数4（参数4为nil）, 那么表示无论是哪个对象发布的与给定的通知名称相同的通知都会被监听得到。
        // 3> 如果参数3 和 参数4都是nil, 那么所有对象发布的所有的通知，这个方法都会监听的到。
        // 也就是listener1监听了object对象发布的名叫name的通知，然后执行listener1的方法
        [notificationCenter addObserver:listener1 selector:@selector(m1:) name:@"tzname1" object:sender1];
        

        
        // 让sender1对象发布一个通知
        // 通过 NSNotificationCenter 发布一个通知，也就是object发布了一个名叫name的通知，其内容是什么
        // 参数1: 通知名称
        // 参数2: 通知发布者（发布通知的对象）
        // 参数3: 通知的具体内容
        [notificationCenter postNotificationName:@"tzname1" object:sender1 userInfo:@{
                                                                                      @"title" : @"两会Duang开始了",
                                                                                      @"content" : @"成龙的头发少了"
                                                                                      }];
        
        
        // 移出通知
        
        
        
    }
    return 0;
}
