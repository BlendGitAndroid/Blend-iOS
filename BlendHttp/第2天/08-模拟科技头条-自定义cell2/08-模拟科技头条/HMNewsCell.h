//
//  HMNewsCell.h
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMNews;
@interface HMNewsCell : UITableViewCell
@property (nonatomic, strong) HMNews *news;

+ (NSString *)getReuseID:(HMNews *)news;
@end
