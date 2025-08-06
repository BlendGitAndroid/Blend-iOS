//
//  CZFriendCell.m
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZFriendCell.h"
#import "CZFriend.h"

@implementation CZFriendCell


+ (instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend_cell";
    CZFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CZFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (void)setFriendModel:(CZFriend *)friendModel
{
    _friendModel = friendModel;
    
    // 把模型中的数据设置给单元格的子控件
    self.imageView.image = [UIImage imageNamed:friendModel.icon];
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
    
    // 根据当前的好友是不是vip来决定是否要将"昵称"显示为红色
    self.textLabel.textColor = friendModel.isVip ? [UIColor redColor] : [UIColor blackColor];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
