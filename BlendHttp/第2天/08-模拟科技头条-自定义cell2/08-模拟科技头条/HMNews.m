//
//  HMNews.m
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMNews.h"

@implementation HMNews
+ (instancetype)newsWithDic:(NSDictionary *)dic {
    HMNews *news = [self new];

    [news setValuesForKeysWithDictionary:dic];

    return news;
}

// 重写time的getter方法，获取时间
- (NSString *)time {
    // 把数字的日期，转换成日期对象
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.addtime.intValue];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 两个日期相减，获取指定的日期部分
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
    if (components.minute < 60) {
        return [NSString stringWithFormat:@"%zd分钟以前", components.minute];
    }
    // 获取小时
    components = [calendar components:NSCalendarUnitHour
                             fromDate:date
                               toDate:[NSDate date]
                              options:0];
    if (components.hour < 24) {
        return [NSString stringWithFormat:@"%zd小时以前", components.hour];
    }

    // 获取日期
    NSDateFormatter *ndf = [[NSDateFormatter alloc] init];
    //    ndf.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    ndf.dateFormat = @"MM-dd HH:mm";
    return [ndf stringFromDate:date];
}

// 发送异步请求获取数据
+ (void)newsWithSuccess:(void (^)(NSArray *array))success
                  error:(void (^)())error {
    NSURL *url = [NSURL
        URLWithString:@"https://dabenshi.cn/other/api/hot.php?type=toutiaoHot"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *_Nullable response,
                                  NSData *_Nullable data,
                                  NSError *_Nullable connectionError) {
                if (connectionError) {
                    NSLog(@"连接错误 %@", connectionError);
                    return;
                }

                //
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200 ||
                    httpResponse.statusCode == 304) {
                    // 解析数据 JSON形式的字符串转换成OC对象
                    NSArray *array =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:NULL];
                    // 字典转模型
                    NSMutableArray *mArray =
                        [NSMutableArray arrayWithCapacity:10];
                    [array enumerateObjectsUsingBlock:^(id _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL *_Nonnull stop) {
                      HMNews *news = [HMNews newsWithDic:obj];
                      [mArray addObject:news];
                    }];

                    //            NSLog(@"%@",mArray);

                    // 调用成功的回调
                    if (success) {
                        success(mArray.copy);
                    }

                } else {
                    //            NSLog(@"服务器内部错误");
                    if (error) {
                        error();
                    }
                }
              }];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

- (NSString *)description {
    return
        [NSString stringWithFormat:
                      @"%@{title:%@,summary:%@,img:%@,sitename:%@,addtime:%d}",
                      [super description], self.title, self.summary, self.img,
                      self.sitename, self.addtime.intValue];
}
@end
