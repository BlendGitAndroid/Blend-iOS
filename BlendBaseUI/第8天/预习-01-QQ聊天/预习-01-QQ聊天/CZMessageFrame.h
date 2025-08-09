//
//  CZMessageFrame.h
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#define CZTextFont 15

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class CZMessage;
@interface CZMessageFrame : NSObject

// 时间Label的frame
@property (nonatomic, assign, readonly) CGRect timeF;

// 头像的frame
@property (nonatomic, assign, readonly) CGRect iconF;

// 正文的frame
@property (nonatomic, assign, readonly) CGRect textF;

// 行高
@property (nonatomic, assign, readonly) CGFloat rowHeight;

// 引用数据模型
@property (nonatomic, strong) CZMessage *message;
@end
