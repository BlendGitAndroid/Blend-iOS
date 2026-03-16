//
//  HMNews.h
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject

// API数据字段映射
@property (nonatomic, copy) NSString *title;       // 标题
@property (nonatomic, copy) NSString *summary;     // 摘要 (暂时没用到)
@property (nonatomic, copy) NSString *img;         // 图片URL (映射image_url)
@property (nonatomic, copy) NSString *sitename;    // 来源 (暂时没用到)
@property (nonatomic, strong) NSString *addtime;   // 时间戳 (暂时没用到)

// 新增API字段
@property (nonatomic, copy) NSString *url;         // 新闻链接
@property (nonatomic, copy) NSString *mobilUrl;    // 移动端链接
@property (nonatomic, copy) NSString *hot_value;   // 热度值
@property (nonatomic, copy) NSString *label;       // 标签
@property (nonatomic, copy) NSString *label_desc;  // 标签描述
@property (nonatomic, assign) NSInteger index;     // 排序索引

@property (nonatomic, copy, readonly) NSString *time;

// 工厂方法
+ (instancetype)newsWithDic:(NSDictionary *)dic andTime:(NSString *)time;

// 发送异步请求获取数据 - 改进版
+ (void)newsWithSuccess:(void(^)(NSArray<HMNews *> *newsList))success 
                  error:(void(^)(NSError *error))error;

@end
