//
//  HMDownloader.h
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMDownloader : NSOperation
+ (instancetype)downloader:(NSString *)urlString
              successBlock:(void (^)(NSString *path))successBlock
              processBlock:(void (^)(float process))processBlock
                errorBlock:(void (^)(NSError *error))errorBlock;

// 暂停下载
- (void)pause;
@end
