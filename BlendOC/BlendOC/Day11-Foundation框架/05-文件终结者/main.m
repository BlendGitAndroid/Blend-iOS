//
//  main.m
//  05-文件终结者
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    //1. 先找出指定文件夹中的所有的文件.
    
    NSFileManager *manager = [NSFileManager defaultManager];
    while (1)
    {
        NSArray *arr =  [manager subpathsAtPath:@"/Users/apple/Desktop/sb"];
        if(arr.count > 0)
        {
            for(NSString *path in arr)
            {
                //".jpg"
                NSString *fullParh = [NSString stringWithFormat:@"/Users/apple/Desktop/sb/%@",path];
                //1.先判断文件是否可以删除.
                if([manager isDeletableFileAtPath:fullParh])
                {
                    [manager removeItemAtPath:fullParh error:nil];
                }
            }
        }
    }
    
    return 0;
}
