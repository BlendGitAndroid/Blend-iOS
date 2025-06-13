/*
 
   1. 可以将整个MRC程序,转换为ARC程序;
 
   2.
 
   
 
 */

#import <Foundation/Foundation.h>
#import "Microblog.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //创建1个账户.
        Account *a1 = [Account new];
        a1.userName  = @"luoyonghao250";
        a1.password = @"dawoya";
        a1.registDate = (CZDate){2015,11,10};
        
        User *lyh = [User new];
        lyh.nickName = @"罗永浩萌萌哒";
        lyh.birthday = (CZDate){1976,12,12};
        lyh.account = a1;
        
        Microblog *b1 = [Microblog new];
        b1.content = @"今天的天气真好,锤子手机销量高!";
        b1.imgURL = @"http://www.itcast.cn/logo.gif";
        b1.user = lyh;
        b1.zhuanFaBlog = nil;
        
        Account *a2 = [Account new];
        a2.userName  = @"fangZhouZhiv587";
        a2.password = @"zhuiwoya";
        a2.registDate = (CZDate){2015,11,11};
        
        User *fzz = [User new];
        fzz.nickName = @"打假勇士";
        fzz.birthday = (CZDate){1976,12,11};
        fzz.account = a2;
        
        
        Microblog *b2 = [Microblog new];
        b2.content = @"好个毛线!";
        b2.imgURL = @"http://www.itcast.cn/logo.gif";
        b2.user = fzz;
        b2.zhuanFaBlog = b1;
       
    }
    return 0;
}
