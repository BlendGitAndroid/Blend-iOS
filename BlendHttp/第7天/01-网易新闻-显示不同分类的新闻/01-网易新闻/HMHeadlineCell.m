//
//  HMHeadlineCell.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMHeadlineCell.h"
#import "HMHeadline.h"
#import <UIImageView+AFNetworking.h>
@interface HMHeadlineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation HMHeadlineCell

- (void)setHeadline:(HMHeadline *)headline {
    _headline = headline;
    //解决重用的问题
    self.imgsrcView.image = nil;
    self.titleView.text = nil;
    
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    
    self.titleView.text = headline.title;
    //设置当前是第几张图片
    self.pageControl.currentPage = self.tag;
    
}

@end
