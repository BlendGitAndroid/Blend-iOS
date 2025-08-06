//
//  CZWeiboFrame.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZWeiboFrame.h"
#import "CZWeibo.h"

@implementation CZWeiboFrame

// 重写weibo属性的set方法
- (void)setWeibo:(CZWeibo *)weibo
{
    _weibo = weibo;
    
    // 计算每个控件的frame, 和行高
    
    // 提取统一的间距
    CGFloat margin = 10;
    
    // 1. 头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    
    // 2. 昵称
    // 获取昵称字符串
    NSString *nickName = weibo.name;
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    
    // 根据Label中文字的内容, 来动态计算Label的高和宽
    CGSize nameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = iconY + (iconH - nameH) / 2; // 将文本的高度显示为图标高度的一半
    
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    
    
    // 3. 会员
    CGFloat vipW = 10;
    CGFloat vipH = 10;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    CGFloat vipY = (nameH - vipH) * 0.5 + nameY;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    
    
    // 4. 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    CGSize textSize = [self sizeWithText:weibo.text andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    
    // 5. 配图
    CGFloat picW = 100;
    CGFloat picH = 100;
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(_textFrame) + margin;
    _picFrame = CGRectMake(picX, picY, picW, picH);
    
    
    //6. 计算每行的高度
    CGFloat rowHeight = 0;
    if (self.weibo.picture) {
        // 如果有配图, 那么行高就等于配图的最大的Y值  + margin
        rowHeight = CGRectGetMaxY(_picFrame) + margin;
    } else {
        // 如果没有配图, 那么行高就等于正文的最大的Y值  + margin
        rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    
    // 注意：：： 计算完毕行高以后，不要忘记为属性赋值。
    _rowHeight = rowHeight;
    
    
}

// 根据给定的字符串、最大值的size、给定的字体, 来计算文字应该占用的大小
// 这是iOS中处理动态文本布局的标准写法
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
@end
