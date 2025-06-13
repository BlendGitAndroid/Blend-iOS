/*
 
 在MRC
 一、微博类 (Microblog)
	属性：
* 文字内容
 * 图片
 * 发表时间 (可以用字符串表示NSString)
 * 作者
 * 被转发的微博
 * 评论数
 * 转发数
 * 点赞数
 
 二、作者类 (User)
 * 名称
 * 生日
 * 账号
 三、账号类 (Account)
 * 账号名称
 * 账号密码
 * 账号注册时间 (可以用字符串表示NSString)
 

 
 
 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Microblog.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //创建1个账户.
        Account *a1 = [[Account new] autorelease];
        a1.userName  = @"luoyonghao250";
        a1.password = @"dawoya";
        a1.registDate = (CZDate){2015,11,10};
        
        User *lyh = [[User new] autorelease];
        lyh.nickName = @"罗永浩萌萌哒";
        lyh.birthday = (CZDate){1976,12,12};
        lyh.account = a1;
        
        Microblog *b1 = [[Microblog new] autorelease];
        b1.content = @"今天的天气真好,锤子手机销量高!";
        b1.imgURL = @"http://www.itcast.cn/logo.gif";
        b1.user = lyh;
        b1.zhuanFaBlog = nil;
        
        Account *a2 = [[Account new] autorelease];
        a2.userName  = @"fangZhouZhiv587";
        a2.password = @"zhuiwoya";
        a2.registDate = (CZDate){2015,11,11};
        
        User *fzz = [[User new] autorelease];
        fzz.nickName = @"打假勇士";
        fzz.birthday = (CZDate){1976,12,11};
        fzz.account = a2;
        
        
        Microblog *b2 = [[Microblog new] autorelease];
        b2.content = @"好个毛线!";
        b2.imgURL = @"http://www.itcast.cn/logo.gif";
        b2.user = fzz;
        b2.zhuanFaBlog = b1;
       
    }
    return 0;
}
