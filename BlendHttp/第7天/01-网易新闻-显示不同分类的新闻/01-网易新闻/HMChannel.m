//
//  HMChannel.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMChannel.h"

@implementation HMChannel
+ (instancetype)channelWithDic:(NSDictionary *)dic {
    HMChannel *channel = [self new];
    
    [channel setValuesForKeysWithDictionary:dic];
    return channel;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
//加载本地数据
+ (NSArray *)channels {
    //加载json
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dic[@"tList"];
    //字典转模型
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HMChannel *channel = [self channelWithDic:obj];
        [mArray addObject:channel];
    }];
    
    return [mArray sortedArrayUsingComparator:^NSComparisonResult(HMChannel  *obj1, HMChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

- (NSString *)urlString {
    
    return [NSString stringWithFormat:@"article/headline/%@/0-140.html",self.tid];
}
@end
