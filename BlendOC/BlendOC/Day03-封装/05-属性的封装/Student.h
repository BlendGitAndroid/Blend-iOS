//
//  Student.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
 
    NSString *_name;
    int _age;
    int _yuWen;
    int _shuXue;
    int _yingYu;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(int)age;
- (int)age;

- (void)setYuWen:(int)yuWen;
- (int)yuWen;

- (void)setShuXue:(int)shuXue;
- (int)shuXue;

- (void)setYingYu:(int)yingYu;
- (int)yingYu;

- (void)show;




@end
