//
//  Student.m
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Student.h"

@interface Student ()
{
    NSString *_name;
}

@property(nonatomic,assign)int age;

- (void)study;
- (void)play;

@end




@implementation Student


- (void)study
{
    NSLog(@"啦啦啦啦.上学啦");
}

- (void)hehe
{
    
}
- (void)play
{
    NSLog(@"玩...");
}





@end
