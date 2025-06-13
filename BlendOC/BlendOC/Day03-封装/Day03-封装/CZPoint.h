//
//  CZPoint.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZPoint : NSObject
{
    @public
    int _x;
    int _y;
}

//计算当前这个点和另外1个点之间的距离.
- (double)distanceWithOtherPoint:(CZPoint *)otherPoint;



@end
