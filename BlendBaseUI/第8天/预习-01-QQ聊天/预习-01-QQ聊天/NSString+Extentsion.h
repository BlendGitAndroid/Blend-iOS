//
//  NSString+Extentsion.h
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (Extentsion)
// 对象方法
- (CGSize)sizeOfTextFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

// 类方法
+ (CGSize)sizeOfTextFontSize:(NSString *)text font:(CGFloat)fontSize maxSize:(CGSize)maxSize;
@end
