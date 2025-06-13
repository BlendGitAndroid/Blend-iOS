//
//  CZArray.m
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "CZArray.h"
#import <string.h>


@implementation CZArray
- (void)sortWithCountries:(char *[])countries andLength:(int)len andCompareBlock:(NewType)compareBlock
{
       
    for(int i = 0; i < len - 1; i++)
    {
        for(int j = 0; j < len - 1 - i; j++)
        {
            //j  j+1;
            //最开始的做法:比较j和j+1这两个字符串,我们直接比较的是字母顺序.
            //但是这么写的话 就写死了.
            //想法: 比较这两个字符串的大小,不要方法的内部自己写代码去比.
            //      因为不管写什么代码都是写死得.
            //让调用者自己写1段代码来比较这两个字符串的大小.
            
            //这个地方需要执行调用者写的1段代码来比较j j+1的大小.
            //BOOL (^compareBlock)(char *country1,char *country2);
            
            //写1个block来存储1段代码,这段代码做的事情:比较j j+1两个字符串的大小.返回结果.
            //int res =   strcmp(countries[j], countries[j+1]);
            
            BOOL res =   compareBlock(countries[j], countries[j+1]);
            if(res == YES)
            {
                char *temp = countries[j];
                countries[j] = countries[j+1];
                countries[j+1] = temp;
            }
        }
    }

}







@end
