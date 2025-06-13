//
//  NSArray+itcast.m
//  Day10-Foundation框架
//
//  Created by apple on 15/11/13.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "NSArray+itcast.h"

@implementation NSArray (itcast)
- (void)bianliWithBlock:(void (^)(id obj,int index,BOOL *stop))block
{
    
    BOOL stop = NO;
    
    for(int i = 0; i < self.count; i++)
    {
    
        block(self[i],i,&stop);
        if(stop == YES)
        {
            break;
        }
           //如何处理遍历出来的元素呢?交给调用者.
        //void (^block)(id obj)
       //block(self[i],i);
        
    }
    
}
@end
