//
//  CZMessage.h
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义枚举
typedef enum {
    CZMessageTypeSelf = 0, // 表示自己
    CZMessageTypeOther = 1  // 表示对方
} CZMessageType;

@interface CZMessage : NSObject

// 正文消息
@property (nonatomic, copy) NSString *text;

// 消息发送的事件
@property (nonatomic, copy) NSString *time;

// 消息的类型（表示是对方发送的消息还是自己发送的消息）
@property (nonatomic, assign) CZMessageType type;

// 用来记录是否需要显示"时间Label"
@property (nonatomic, assign, getter=isHiddenTime) BOOL hiddenTime;


- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)messageWithDic:(NSDictionary *)dic;

+ (NSArray *)messagesList;
@end
