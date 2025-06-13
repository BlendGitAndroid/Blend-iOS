//
//  Boy.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFProtocol.h"


@interface Boy : NSObject <GFProtocol>

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)int money;
@property(nonatomic,strong)id<GFProtocol> girlFriend;

/**
 *  谈恋爱
 */
- (void)talkLove;



@end
