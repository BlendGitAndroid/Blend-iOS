//
//  Person.h
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject
{
    //Dog *_dog;
}
//- (void)setDog:(Dog *)dog;
//- (Dog *)dog;

@property(nonatomic,retain)Dog *dog;

@end
