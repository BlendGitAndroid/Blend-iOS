//
//  HMNews.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMNews.h"
#import "HMNetworkTools.h"
@implementation HMNews
+ (instancetype)newsWithDic:(NSDictionary *)dic {
    HMNews *news = [self new];
    
    [news setValuesForKeysWithDictionary:dic];
    return news;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

//发送异步请求，获取数据，字典转模型
+ (void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock {
    //http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
    [[HMNetworkTools sharedManager] GET:@"article/headline/T1348647853363/0-140.html" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        //获取第一个键
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMNews *news = [self newsWithDic:obj];
            [mArray addObject:news];
        }];
        //调用回调的block
        if (successBlock) {
            successBlock(mArray.copy);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
@end
