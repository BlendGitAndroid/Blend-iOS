//
//  HMNewsCell.m
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMNewsCell.h"
#import "HMNews.h"
#import "UIImageView+WebCache.h"
@interface HMNewsCell ()
@property(weak, nonatomic) IBOutlet UILabel *titleView;
@property(weak, nonatomic) IBOutlet UILabel *summaryView;
@property(weak, nonatomic) IBOutlet UILabel *sitenameView;
@property(weak, nonatomic) IBOutlet UIImageView *imgView;
@property(weak, nonatomic) IBOutlet UILabel *addtimeView;

@end
@implementation HMNewsCell
- (void)setNews:(HMNews *)news {
    _news = news;
    self.titleView.text = news.title;
    self.summaryView.text = news.summary;
    self.sitenameView.text = news.sitename;
    self.addtimeView.text = news.time;

    [self.imgView sd_setImageWithURL:[NSURL URLWithString:news.img]];
}

// 根据模型数据，返回可重用标示
+ (NSString *)getReuseID:(HMNews *)news {
    if (news.img.length == 0) {
        return @"news1";
    }

    return @"news";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 判断news.title 的长度，和label的长度比较
    // 如果title的长度> label的长度  隐藏summaryView

    // 强制计算lebal的自动布局的约束
    // 这行代码的作用是 强制立即计算并应用视图的布局约束
    // ，获取视图最终的真实尺寸。 在 layoutSubviews
    // 方法中，视图刚刚完成自动布局约束的计算，但 frame 可能还未更新 ，
    // 所以需要强制计算一次，才能获取到正确的尺寸。
    [self.titleView layoutIfNeeded];

    // 获取title的长度
    CGFloat titleLength =
        [self.news.title
            // 计算尺寸的方法
            sizeWithAttributes:@{NSFontAttributeName : self.titleView.font}]
            .width;

    NSLog(@"titleLength  :  %f -- %@", titleLength, self.news.title);
    NSLog(@"label width  :  %f", self.titleView.frame.size.width);

    if (titleLength > self.titleView.frame.size.width) {
        self.summaryView.hidden = YES;
    } else {
        self.summaryView.hidden = NO;
    }
}
@end
