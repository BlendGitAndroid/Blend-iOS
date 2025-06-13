//
//  CZPoint.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "CZPoint.h"
#import <math.h>

@implementation CZPoint

//计算当前这个点和另外1个点之间的距离.
- (double)distanceWithOtherPoint:(CZPoint *)otherPoint
{
    //1. 拿到当前这个点的x和y坐标
    
    //2. 再拿到传入的这个点的x y坐标.
    
    //3. 套公式得结果.
    
    double res1 = (_x - otherPoint->_x) * (_x - otherPoint->_x);
    double res2 = (_y - otherPoint->_y) * (_y - otherPoint->_y);
    double res3 = res1 + res2;
    
    
    return  sqrt(res3);
    
    
    
    
}
@end
