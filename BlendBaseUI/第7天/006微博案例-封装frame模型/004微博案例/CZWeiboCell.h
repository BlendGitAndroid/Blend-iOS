//
//  CZWeiboCell.h
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZWeiboFrame;
@interface CZWeiboCell : UITableViewCell

@property (nonatomic, strong) CZWeiboFrame *weiboFrame;

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView;
@end
