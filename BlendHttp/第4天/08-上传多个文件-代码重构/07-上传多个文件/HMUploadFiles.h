//
//  HMUploadFiles.h
//  07-上传多个文件
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMUploadFiles : NSObject
// 上传单个文件
+ (void)uploadFile:(NSString *)urlString
         fieldName:(NSString *)fieldName
          filePath:(NSString *)filePath;

+ (void)uploadFile:(NSString *)urlString
         fieldName:(NSString *)fieldName
          filePath:(NSString *)filePath
            params:(NSDictionary *)params;

// 上传多个文件
+ (void)uploadFiles:(NSString *)urlString
          fieldName:(NSString *)fieldName
          filePaths:(NSArray *)filePaths
             params:(NSDictionary *)params;
@end
