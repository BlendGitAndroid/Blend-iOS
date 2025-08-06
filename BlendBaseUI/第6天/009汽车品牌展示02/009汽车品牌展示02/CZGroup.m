//
//  CZGroup.m
//  009汽车品牌展示02
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZGroup.h"
#import "CZCar.h"
@implementation CZGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //        self.title = dict[@"title"];
        //        self.cars = dict[@"cars"];

        [self setValuesForKeysWithDictionary:dict];
        
        // 当有模型嵌套的时候需要手动把字典转成模型
        // 创建一个用来保存模型的数组
        // 手动的进行字典转模型
        // 再将里面的care转换为模型
        NSMutableArray *arrayModels = [NSMutableArray array];
        // 手动做一下字典转模型
        for (NSDictionary *item_dict in dict[@"cars"]) {
            CZCar *model = [CZCar carWithDict:item_dict];
            [arrayModels addObject:model];
        }
        self.cars = arrayModels;
    }
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
