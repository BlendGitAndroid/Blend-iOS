//
//  CZGroupHeaderView.h
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZGroupHeaderView;
@protocol CZGroupHeaderViewDelegate <NSObject>

- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView;

@end


@class CZGroup;
@interface CZGroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) CZGroup *group;

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;

// 增加一个代理属性
@property (nonatomic, weak) id<CZGroupHeaderViewDelegate> delegate;

@end
