//
//  CZAppCell.h
//  003应用管理
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZAppCell;

@protocol CZAppCellDelegate <NSObject>
- (void)appCellDidClickDownloadButton:(CZAppCell *)appCell;
@end


@class CZApp;
@interface CZAppCell : UITableViewCell

@property (nonatomic, strong) CZApp *app;

@property (nonatomic, weak) id<CZAppCellDelegate> delegate;

@end
