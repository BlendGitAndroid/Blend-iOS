//
//  HMNewsCell.h
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMNews;
@interface HMNewsCell : UITableViewCell
@property (nonatomic, strong) HMNews *news;

+ (NSString *)getReuseId:(HMNews *)news;
+ (CGFloat)getRowHeight:(HMNews *)news;
@end
