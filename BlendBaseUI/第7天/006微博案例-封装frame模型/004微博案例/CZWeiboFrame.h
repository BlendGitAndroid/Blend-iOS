//
//  CZWeiboFrame.h
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

@class CZWeibo;
@interface CZWeiboFrame : NSObject

@property (nonatomic, strong) CZWeibo *weibo;

// 用来保存头像的frame
@property (nonatomic, assign, readonly) CGRect iconFrame;

// 昵称的frame
@property (nonatomic, assign, readonly) CGRect nameFrame;


// vip的frame
@property (nonatomic, assign, readonly) CGRect vipFrame;

// 正文的frame
@property (nonatomic, assign, readonly) CGRect textFrame;

//配图的frame
@property (nonatomic, assign, readonly) CGRect picFrame;

// 行高
@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end
