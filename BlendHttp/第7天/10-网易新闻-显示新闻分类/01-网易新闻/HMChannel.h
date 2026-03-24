//
//  HMChannel.h
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

//新闻的分类（频道）
@interface HMChannel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;

+ (instancetype)channelWithDic:(NSDictionary *)dic;
//加载本地数据
+ (NSArray *)channels;
@end
