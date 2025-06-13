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
    NSString
    int _arr[10];
}

- (void)bianLiWithBlock:(void (^)(int val))processBlock;


@end
