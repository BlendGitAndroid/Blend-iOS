//
//  HMNews.h
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *sitename;
@property (nonatomic, strong) NSNumber *addtime;

@property (nonatomic, copy, readonly) NSString *time;
+ (instancetype)newsWithDic:(NSDictionary *)dic;
//发送异步请求获取数据
+ (void)newsWithSuccess:(void(^)(NSArray *array))success error:(void(^)())error;
@end
