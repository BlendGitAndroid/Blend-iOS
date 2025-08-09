//
//  NotificationSender.h
//  003通知的发布与监听
//
//  Created by apple on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

// 通知的发布者
@interface NotificationSender : NSObject

// 通知发布者的名称
@property (nonatomic, copy) NSString *name;

@end
