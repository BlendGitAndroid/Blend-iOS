//
//  UIImage+Extension.m
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

// 这个方法是 UIImage 的一个分类方法，用于实现图片的 可拉伸处理 ，核心功能是通过设置「端盖保护」区域实现图片的无损拉伸。
// 其核心是解决普通图片拉伸时边缘失真的问题，常见于聊天气泡、按钮背景等需要自适应内容大小的场景。
// - 端盖保护（Cap Insets） ：图片被分为3×3的网格区域，4个角落（左上、右上、左下、右下）和4条边（上、下、左、右）为保护区域，中央区域为可拉伸区域
// - 参数意义 ：
//   - leftCapWidth ：从左侧开始保护的宽度（右侧自动对称计算）
//   - topCapHeight ：从顶部开始保护的高度（底部自动对称计算）
// - 效果 ：拉伸时只有中央区域会被平铺，边缘和角落保持原始像素，避免失真
+ (UIImage *)resizeImage:(NSString *)imgName
{
    // 先加载原图
    UIImage *img = [UIImage imageNamed:imgName];
    // 设置保护区域，防止图片拉伸时边缘失真，并返回处理后的图片,但是这个方法过时了
//    return [img stretchableImageWithLeftCapWidth:img.size.width*0.5 topCapHeight:img.size.height*0.5];
    
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height * 0.5,img.size.width * 0.5, img.size.height * 0.5, img.size.width * 0.5) resizingMode:UIImageResizingModeStretch];
}
@end
