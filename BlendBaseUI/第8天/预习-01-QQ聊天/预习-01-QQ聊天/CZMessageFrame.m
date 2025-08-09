//
//  CZMessageFrame.m
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import "CZMessageFrame.h"
#import "CZMessage.h"
#import "NSString+Extentsion.h"
#import <UIKit/UIKit.h>
@implementation CZMessageFrame

- (void)setMessage:(CZMessage *)message
{
    _message = message;
    
    // 计算每个控件的frame 和 行高
    
    // 设置一个统一的间距
    CGFloat margin = 10;
    
    // 计算时间label的frame
    CGFloat timeW = 375;
    CGFloat timeH = 40;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    if (!message.isHiddenTime) {
        // 如果需要显示时间label, 那么再计算时间label的frame
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 计算头像的frame
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconX;
    if (message.type == CZMessageTypeSelf) {
        iconX = 375 - iconW - margin;   // 如果是自己发的，则需要用屏幕的宽度-头像的宽度-margin
    }else{
        iconX = margin;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 计算消息正文的frame
    // 1. 先计算正文的大小
    CGSize textSize = [message.text sizeOfTextFontSize:CZTextFont maxSize:CGSizeMake(200, MAXFLOAT)];
    //[self sizeOfText:message.text fontSize:CZTextFont maxSize:CGSizeMake(200, MAXFLOAT)];
    
    // 在这里增加上文本的内边距，查看CZMessageCell的文本边距设置
    CGSize textButtonSize = CGSizeMake(textSize.width + 40, textSize.height + 40);
    
    // 2. 再计算x,y
    CGFloat textY = iconY;
    CGFloat textX;
    if (message.type ==  CZMessageTypeSelf) {
        textX = iconX - textButtonSize.width - margin; // 如果是自己发的，头像的宽度-
    }else{
        textX = CGRectGetMaxX(_iconF) + margin;
    }
    _textF = CGRectMake(textX, textY, textButtonSize.width, textButtonSize.height);
    
    // 计算行高
    // 获取 头像的最大的Y值和正文的最大的Y值, 然后用最大的Y值+ margin
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    _rowHeight = MAX(textMaxY, iconMaxY) + margin;
}



@end
