//
//  NSArray+Ex.m
//  04-解决数组输出汉字的问题
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "NSArray+Ex.h"

@implementation NSArray (Ex)

// ❌ 不要重写 description，会破坏系统行为
// ✅ 推荐重写 descriptionWithLocale: 或创建自定义方法
// ✅ 自定义方法名更明确，不会产生副作用
// ✅ 可以同时保留原始的 description 行为用于调试
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *mStr = [NSMutableString string];
    [mStr appendString:@"(\r\n"];
    [self enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx,
                                       BOOL *_Nonnull stop) {
      [mStr appendFormat:@"\t%@,\r\n", obj];
    }];

    [mStr appendString:@")"];
    return mStr.copy;
}
@end
