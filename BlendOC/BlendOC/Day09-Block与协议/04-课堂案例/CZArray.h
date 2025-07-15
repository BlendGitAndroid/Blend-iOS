//
//  CZArray.h
//  Day09-Block与协议
//
//  Created by apple on
//  Copyright © 2020年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZArray : NSObject
{
    int _arr[10];
}

- (void)bianli;

- (void)bianLiWithBlock:(void (^)(int val))processBlock; // 所以void (^)(int val)是一个block类型的声明，尤其参数是需要加上括号的，所以最后会变成(void (^)(int val))


@end
