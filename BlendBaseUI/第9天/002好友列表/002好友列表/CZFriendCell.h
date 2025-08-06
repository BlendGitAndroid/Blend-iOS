//
//  CZFriendCell.h
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZFriend;
@interface CZFriendCell : UITableViewCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CZFriend *friendModel;
@end
