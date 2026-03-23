//
//  HMDownloader.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMDownloader.h"

@implementation HMDownloader
- (void)download:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *_Nullable response,
                                  NSData *_Nullable data,
                                  NSError *_Nullable connectionError) {
                // 保存文件
                [data writeToFile:@"/Users/xuhai/Desktop/123.hm"
                       atomically:YES];
                NSLog(@"下载完成");
              }];
}
@end
