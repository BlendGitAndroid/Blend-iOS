//
//  HMDownloaderManager.h
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMDownloaderManager : NSObject
+ (instancetype)sharedManager;

- (void)download:(NSString *)urlString
    successBlock:(void (^)(NSString *path))successBlock
    processBlock:(void (^)(float process))processBlock
      errorBlock:(void (^)(NSError *error))errorBlock;

- (void)pause:(NSString *)urlString;
@end
