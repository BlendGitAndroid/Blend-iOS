//
//  Student.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)setName:(NSString *)name
{
    if([name length] < 2 || [name isEqualToString:@"毛泽东"] || [name isEqualToString:@"胡锦涛"] || [name isEqualToString:@"习近平"])
    {
        _name = @"无名";
        return;
    }
    _name = name;
    
}
- (NSString *)name
{
    return _name;
}

- (void)setAge:(int)age
{
    _age = age >= 0 && age <= 120 ? age : 18;
}
- (int)age
{
    return _age;
}

- (void)setYuWen:(int)yuWen
{
    _yuWen = yuWen >= 0 && yuWen <= 150 ? yuWen : 0;
}
- (int)yuWen
{
    return _yuWen;
}

- (void)setShuXue:(int)shuXue
{
    _shuXue = shuXue >= 0 && shuXue <= 150 ? shuXue : 0;

}
- (int)shuXue
{
    return _shuXue;
}

- (void)setYingYu:(int)yingYu
{
    _yingYu = yingYu >= 0 && yingYu <= 150 ? yingYu : 0;
}
- (int)yingYu
{
    return _yingYu;
}

- (void)show
{
    NSLog(@"大家好,我叫%@，我今年%d岁 我的总成绩是%d 我的平均成绩是%lf",
          _name,
          _age,
          _yuWen+_shuXue+_yingYu,
          (_yuWen+_shuXue+_yingYu) * 1.0f/ 3
          );
}
@end
