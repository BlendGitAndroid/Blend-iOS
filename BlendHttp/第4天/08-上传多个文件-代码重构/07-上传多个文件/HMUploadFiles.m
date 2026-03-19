//
//  HMUploadFiles.m
//  07-上传多个文件
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//
#define kBOUNDARY @"abc"
#import "HMUploadFiles.h"

@implementation HMUploadFiles
// 上传单个文件
+ (void)uploadFile:(NSString *)urlString
         fieldName:(NSString *)fieldName
          filePath:(NSString *)filePath {
    [self uploadFile:urlString
           fieldName:fieldName
            filePath:filePath
              params:nil];
}

+ (void)uploadFile:(NSString *)urlString
         fieldName:(NSString *)fieldName
          filePath:(NSString *)filePath
            params:(NSDictionary *)params {
    [self uploadFiles:urlString
            fieldName:fieldName
            filePaths:@[ filePath ]
               params:params];
}

// urlString 上传的地址
// fieldName 是上传控件的名称
// filePaths 要上传的文件的路径
// params    要上传的其它的一些额外的信息（文本框）
+ (void)uploadFiles:(NSString *)urlString
          fieldName:(NSString *)fieldName
          filePaths:(NSArray *)filePaths
             params:(NSDictionary *)params {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置post
    request.HTTPMethod = @"post";
    // 设置请求头 Content-Type:multipart/form-data;
    // boundary=----WebKitFormBoundaryQA5pv9R6XT4df70B
    [request setValue:[NSString
                          stringWithFormat:@"multipart/form-data; boundary=%@",
                                           kBOUNDARY]
        forHTTPHeaderField:@"Content-Type"];

    // 设置请求体
    request.HTTPBody = [self makeBody:fieldName
                            filePaths:filePaths
                               params:params];

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
                    // 解析数据
                    id json = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:NULL];
                    NSLog(@"%@", json);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

// 返回请求体
+ (NSData *)makeBody:(NSString *)fieldName
           filePaths:(NSArray *)filePaths
              params:(NSDictionary *)params {
    NSMutableData *mData = [NSMutableData data];
    // 1 拼文件
    [filePaths enumerateObjectsUsingBlock:^(NSString *filePath, NSUInteger idx,
                                            BOOL *_Nonnull stop) {
      //        ------WebKitFormBoundaryQA5pv9R6XT4df70B
      //        Content-Disposition: form-data; name="userfile[]";
      //        filename="01.jpg" Content-Type: image/jpeg

      //        二进制数据
      //
      NSMutableString *mString = [NSMutableString string];
      if (idx == 0) {
          [mString appendFormat:@"--%@\r\n", kBOUNDARY];
      } else {
          [mString appendFormat:@"\r\n--%@\r\n", kBOUNDARY];
      }

      [mString appendFormat:@"Content-Disposition: form-data; name=\"%@\"; "
                            @"filename=\"%@\"\r\n",
                            fieldName, [filePath lastPathComponent]];
      [mString appendString:@"Content-Type: application/octet-stream\r\n"];
      [mString appendString:@"\r\n"];
      // 把字符串转换成二进制数据
      [mData appendData:[mString dataUsingEncoding:NSUTF8StringEncoding]];

      // 加载文件
      NSData *data = [NSData dataWithContentsOfFile:filePath];
      [mData appendData:data];
    }];

    // 2 拼字符串，就是param的key-value
    [params enumerateKeysAndObjectsUsingBlock:^(
                id _Nonnull key, id _Nonnull obj, BOOL *_Nonnull stop) {
      //        ------WebKitFormBoundaryQA5pv9R6XT4df70B
      //        Content-Disposition: form-data; name="username"
      //
      //        123123
      NSMutableString *mString = [NSMutableString string];
      [mString appendFormat:@"\r\n--%@\r\n", kBOUNDARY];
      [mString
          appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n", key];
      [mString appendString:@"\r\n"];
      [mString appendFormat:@"%@", obj];

      [mData appendData:[mString dataUsingEncoding:NSUTF8StringEncoding]];
    }];

    // 3 结束
    NSString *end = [NSString stringWithFormat:@"\r\n--%@--", kBOUNDARY];
    [mData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];

    return mData.copy;
}
@end
