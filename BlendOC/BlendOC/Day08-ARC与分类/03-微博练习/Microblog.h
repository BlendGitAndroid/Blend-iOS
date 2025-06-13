/*
 
 * 文字内容
 * 图片
 * 发表时间 (可以用字符串表示NSString)
 * 作者
 * 被转发的微博
 * 评论数
 * 转发数
 * 点赞数
 
 */
#import <Foundation/Foundation.h>
#import "User.h"

@interface Microblog : NSObject

/**
 *  微博的文字内容
 */
@property(nonatomic,retain)NSString *content;

/**
 *  微博配图路径
 */
@property(nonatomic,retain)NSString *imgURL;

/**
 *  微博发松时间.
 */
@property(nonatomic,assign)CZDate *sendTime;

/**
 *  微博作者
 */
@property(nonatomic,retain)User *user;

/**
 *  转发微博.
 */
@property(nonatomic,retain)Microblog *zhuanFaBlog;



@end
