//
//  ViewController.m
//  03-下载网络图片
//
//  Created by Apple on 15/10/17.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

#import "HMAppInfo.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
@property(weak, nonatomic) IBOutlet UIImageView *imageview;

@property(nonatomic, strong) NSArray *appInfos;

@end

@implementation ViewController
// 懒加载

- (NSArray *)appInfos {
    if (_appInfos == nil) {
        _appInfos = [HMAppInfo appInfos];
    }
    return _appInfos;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 随机取一个模型
    int index = arc4random_uniform((u_int32_t)self.appInfos.count);
    HMAppInfo *appInfo = self.appInfos[index];

    // 调用的的分类
    [self.imageview setImageUrlString:appInfo.icon];
}

@end
