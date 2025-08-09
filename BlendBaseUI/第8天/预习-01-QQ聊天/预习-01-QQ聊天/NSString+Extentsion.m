//
//  NSString+Extentsion.m
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import "NSString+Extentsion.h"
#import <UIKit/UIKit.h>
@implementation NSString (Extentsion)

// 扩展方法
- (CGSize)sizeOfTextFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)sizeOfTextFontSize:(NSString *)text font:(CGFloat)fontSize maxSize:(CGSize)maxSize {
    return [text sizeOfTextFontSize:fontSize maxSize:maxSize];
}
@end
