//
//  Person.h
//  Day02-类与对象
//
//  Created by 传智播客 on 15/12/15.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
    float _height;
    //将狗对象作为人的1个属性,代表人拥有1条狗.
    Dog *_dog;
}

- (void)run;

@end
