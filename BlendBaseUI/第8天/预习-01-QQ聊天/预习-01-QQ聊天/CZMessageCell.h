//
//  CZMessageCell.h
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZMessageFrame;

@interface CZMessageCell : UITableViewCell

// 为自定义单元格增加一个frame 模型属性
@property (nonatomic, strong) CZMessageFrame *messageFrame;

// 封装一个创建自定义Cell的方法
+ (instancetype)messageCellWithTableView:(UITableView *)tableView;

@end
