//
//  HMNews.h
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;

@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL imgType;
@property (nonatomic, copy) NSArray *imgextra;

+ (instancetype)newsWithDic:(NSDictionary *)dic;
//发送异步请求，获取数据，字典转模型
+ (void)newsListWithURLString:(NSString *)urlString successBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end
