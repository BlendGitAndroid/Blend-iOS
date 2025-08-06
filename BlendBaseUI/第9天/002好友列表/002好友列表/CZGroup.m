//
//  CZGroup.m
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZGroup.h"
#import "CZFriend.h"
@implementation CZGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        // 把self.friends由字典数组转换为模型数据
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict_sub in self.friends) {
            CZFriend *model = [CZFriend friendWithDict:dict_sub];
            [arrayModels addObject:model];
        }
        self.friends = arrayModels;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
