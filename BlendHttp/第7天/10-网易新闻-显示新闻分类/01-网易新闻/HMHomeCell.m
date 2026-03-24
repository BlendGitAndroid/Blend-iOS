//
//  HMHomeCell.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMHomeCell.h"
#import "HMNewsController.h"

@interface HMHomeCell ()
@property (nonatomic, strong) HMNewsController *newsController;
@end

@implementation HMHomeCell

//当cell从xib或sb中加载完成，加载另一个sb中的新闻列表
- (void)awakeFromNib {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsController = [sb instantiateInitialViewController];
    
    [self.contentView addSubview:self.newsController.view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //让控制器的view的大小和cell的大小一样
    self.newsController.view.frame = self.bounds;
}


@end
