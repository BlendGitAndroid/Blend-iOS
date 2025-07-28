//
//  CZGoodsCell.h
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZGoods;
@interface CZGoodsCell : UITableViewCell

@property (nonatomic, strong) CZGoods *goods;

// 封装一个创建自定义Cell的方法
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView;
@end
