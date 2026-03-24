//
//  HMNewsCell.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMNewsCell.h"
#import <UIImageView+AFNetworking.h>
#import "HMNews.h"
@interface HMNewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextraViews;
@end

@implementation HMNewsCell
- (void)setNews:(HMNews *)news {
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d人回帖",news.replyCount.intValue];
    
    //遍历imgextra
    [news.imgextra enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //从字典中获取图片的路径
        NSString *imgsrc = obj[@"imgsrc"];
        //
        UIImageView *imageView = self.imgextraViews[idx];
        [imageView setImageWithURL:[NSURL URLWithString:imgsrc]];
    }];
    
}
//返回可重用标示
+ (NSString *)getReuseId:(HMNews *)news{
    if (news.imgType) {
        //大图
        return @"news1";
    }else if(news.imgextra){
        return @"news2";
    }
    
    return @"news";
}
//返回行高
+ (CGFloat)getRowHeight:(HMNews *)news {
    if (news.imgType) {
        //大图
        return 200;
    }else if(news.imgextra) {
        //三个图片的cell
        return 150;
    }
    
    return 80;
}

@end
