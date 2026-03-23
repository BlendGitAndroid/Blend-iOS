//
//  HMDownloaderManager.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMDownloaderManager.h"
#import "HMDownloader.h"

@interface HMDownloaderManager ()
// 下载操作缓存池
@property(nonatomic, strong) NSMutableDictionary *downloaderCache;
@end

@implementation HMDownloaderManager
// 懒加载
- (NSMutableDictionary *)downloaderCache {
    if (_downloaderCache == nil) {
        _downloaderCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _downloaderCache;
}

// 单例方法
+ (instancetype)sharedManager {
    static id instance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      instance = [self new];
    });

    return instance;
}

// 暂停
- (void)pause:(NSString *)urlString {
    HMDownloader *downloader = self.downloaderCache[urlString];
    if (downloader == nil) {
        NSLog(@"没有下载操作，无法暂停");
        return;
    }

    [downloader pause];
    // 删除缓存池中的下载操作
    [self.downloaderCache removeObjectForKey:urlString];
}

- (void)download:(NSString *)urlString
    successBlock:(void (^)(NSString *))successBlock
    processBlock:(void (^)(float))processBlock
      errorBlock:(void (^)(NSError *))errorBlock {

    // 判断缓存池中是否有下载操作
    if (self.downloaderCache[urlString]) {
        NSLog(@"正在拼命的下载..");
        return;
    }

    // 下载文件
    HMDownloader *downloader = [HMDownloader new];
    // 添加到缓存池中
    [self.downloaderCache setObject:downloader forKey:urlString];

    [downloader download:urlString
        successBlock:^(NSString *path) {
          // 移除下载操作
          [self.downloaderCache removeObjectForKey:urlString];
          if (successBlock) {
              successBlock(path);
          }
        }
        processBlock:processBlock
        errorBlock:^(NSError *error) {
          // 移除下载操作
          [self.downloaderCache removeObjectForKey:urlString];
          if (errorBlock) {
              errorBlock(error);
          }
        }];
}
@end
