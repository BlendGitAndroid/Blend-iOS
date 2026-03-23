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

// 括号的作用和位置：

// 变量声明：void (^blockName)(parameters) - Block名在 ^ 后
// 方法参数：(void (^)(parameters))paramName - 整个类型用括号包围，因为写不写block名字已经无关紧要了，主要是参数名起作用
// 属性声明：void (^propertyName)(parameters) - 类似变量声明
// typedef：typedef void (^TypeName)(parameters) - 简化复杂语法
// 记忆规则：

// 方法参数 = (类型)参数名 → (Block完整类型)Block参数名
// 其他情况 = 类型 变量名 → Block类型 Block变量名
