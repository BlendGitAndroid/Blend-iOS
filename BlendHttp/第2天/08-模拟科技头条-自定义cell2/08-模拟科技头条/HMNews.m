//
//  HMNews.m
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMNews.h"
#import "HMAPIConfig.h"

@implementation HMNews

#pragma mark - 工厂方法

+ (instancetype)newsWithDic:(NSDictionary *)dic andTime:(NSString *)time{
    HMNews *news = [self new];

    // 安全的字典到模型映射
    news.title = dic[@"title"];
    news.url = dic[@"url"];
    news.mobilUrl = dic[@"mobilUrl"];
    news.hot_value = dic[@"hot_value"];
    news.label = dic[@"label"];
    news.label_desc = dic[@"label_desc"];
    news.index = [dic[@"index"] integerValue];

    // 处理图片URL映射
    news.img = dic[@"image_url"]; // API返回的是image_url，映射到img属性

    // 兼容旧字段（如果需要的话）
    news.summary = dic[@"summary"];
    news.sitename = dic[@"sitename"];
    news.addtime = time;

    return news;
}

// 重写time的getter方法，获取时间
- (NSString *)time {
    // 如果时间是String类型的
    if ([self.addtime isKindOfClass:[NSString class]]) {
        return self.addtime;
    }

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

#pragma mark - 网络请求方法

+ (void)newsWithSuccess:(void (^)(NSArray<HMNews *> *newsList))success
                  error:(void (^)(NSError *error))error {

    // 1. 使用配置化的URL，避免硬编码
    NSURL *url = [NSURL URLWithString:[HMAPIConfig hotNewsURL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    // 2. 设置请求超时
    request.timeoutInterval = [HMAPIConfig requestTimeout];

    // 3. 设置请求头
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json; charset=utf-8"
        forHTTPHeaderField:@"Content-Type"];

    NSLog(@"🚀 开始请求: %@", url.absoluteString);

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *response, NSData *data,
                                  NSError *connectionError) {
                // 4. 网络连接错误处理
                if (connectionError) {
                    NSLog(@"❌ 网络连接失败: %@",
                          connectionError.localizedDescription);
                    NSError *apiError = [HMAPIConfig
                        errorWithCode:HMAPIErrorCodeNetworkFailure
                              message:connectionError.localizedDescription];
                    if (error) {
                        error(apiError);
                    }
                    return;
                }

                // 5. HTTP状态码检查
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                NSLog(@"📡 HTTP状态码: %ld", (long)httpResponse.statusCode);

                if (httpResponse.statusCode != 200 &&
                    httpResponse.statusCode != 304) {
                    NSString *errorMsg = [NSString
                        stringWithFormat:@"服务器错误，状态码：%ld",
                                         (long)httpResponse.statusCode];
                    NSError *serverError =
                        [HMAPIConfig errorWithCode:HMAPIErrorCodeServerError
                                           message:errorMsg];
                    NSLog(@"❌ %@", errorMsg);
                    if (error) {
                        error(serverError);
                    }
                    return;
                }

                // 6. 数据为空检查
                if (!data || data.length == 0) {
                    NSError *dataError =
                        [HMAPIConfig errorWithCode:HMAPIErrorCodeInvalidResponse
                                           message:@"服务器返回空数据"];
                    NSLog(@"❌ 服务器返回空数据");
                    if (error) {
                        error(dataError);
                    }
                    return;
                }

                // 7. JSON解析 - 修复关键问题
                NSError *jsonError = nil;
                NSDictionary *responseDict = [NSJSONSerialization
                    JSONObjectWithData:data
                               options:NSJSONReadingMutableContainers
                                 error:&jsonError];

                if (jsonError ||
                    ![responseDict isKindOfClass:[NSDictionary class]]) {
                    NSError *parseError =
                        [HMAPIConfig errorWithCode:HMAPIErrorCodeDataParseError
                                           message:@"JSON解析失败"];
                    NSLog(@"❌ JSON解析失败: %@",
                          jsonError.localizedDescription);
                    if (error) {
                        error(parseError);
                    }
                    return;
                }

                NSLog(@"✅ JSON解析成功，响应结构: %@", responseDict.allKeys);

                // 8. 检查API返回的success字段
                NSNumber *successFlag = responseDict[@"success"];
                // 检查success字段，判断是否成功
                // 这是将 NSNumber 对象转换为 BOOL 基本类型的方法调用。
                if (![successFlag boolValue]) {
                    NSError *apiError =
                        [HMAPIConfig errorWithCode:HMAPIErrorCodeInvalidResponse
                                           message:@"API返回失败状态"];
                    NSLog(@"❌ API返回失败状态");
                    if (error) {
                        error(apiError);
                    }
                    return;
                }

                // 9. 提取data数组 - 修复数据解析错误
                NSArray *dataArray = responseDict[@"data"];
                if (![dataArray isKindOfClass:[NSArray class]]) {
                    NSError *dataError =
                        [HMAPIConfig errorWithCode:HMAPIErrorCodeDataParseError
                                           message:@"data字段不是数组格式"];
                    NSLog(@"❌ data字段格式错误: %@", [dataArray class]);
                    if (error) {
                        error(dataError);
                    }
                    return;
                }

                NSLog(@"📊 获取到新闻数量: %ld", dataArray.count);

                // 10. 数组转模型
                // 泛型的写法
                NSMutableArray<HMNews *> *newsList =
                    [NSMutableArray arrayWithCapacity:dataArray.count];

                [dataArray
                    enumerateObjectsUsingBlock:^(NSDictionary *newsDict,
                                                 NSUInteger idx, BOOL *stop) {
                      if ([newsDict isKindOfClass:[NSDictionary class]]) {
                          HMNews *news = [HMNews newsWithDic:newsDict andTime:responseDict[@"update_time"]];
                          if (news) {
                              [newsList addObject:news];
                          }
                      } else {
                          NSLog(@"⚠️ 第%ld项不是字典格式，跳过", idx);
                      }
                    }];

                NSLog(@"✅ 成功解析新闻数量: %ld", newsList.count);

                // 11. 成功回调
                if (success) {
                    success([newsList copy]);
                }
              }];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

- (NSString *)description {
    return
        [NSString stringWithFormat:@"%@{\n"
                                   @"  index: %ld,\n"
                                   @"  title: %@,\n"
                                   @"  url: %@,\n"
                                   @"  img: %@,\n"
                                   @"  hot_value: %@,\n"
                                   @"  label: %@ (%@)\n"
                                   @"}",
                                   [super description], (long)self.index,
                                   self.title, self.url, self.img,
                                   self.hot_value, self.label, self.label_desc];
}
@end
