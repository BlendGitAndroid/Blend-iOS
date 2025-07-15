//
//  Person_itcast.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

// 延展本质上是一个分类，标准的分类中()是有名字的，但是延展没有名字
@interface Person ()
{
    float _height;
}


@property(nonatomic,assign)float weight;

- (void)run;
- (void)sleep;


@end
