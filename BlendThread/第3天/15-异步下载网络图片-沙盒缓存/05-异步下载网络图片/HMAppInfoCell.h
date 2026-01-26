//
//  HMAppInfoCell.h
//  05-异步下载网络图片
//
//  Created by Apple on 15/10/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用class修饰，避免循环引用
@class HMAppInfo;
@interface HMAppInfoCell : UITableViewCell
@property(nonatomic, strong) HMAppInfo *appInfo;

// 自定义cell的图标
@property(weak, nonatomic) IBOutlet UIImageView *iconView;

@end
