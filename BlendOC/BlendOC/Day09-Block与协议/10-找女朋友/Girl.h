//
//  Girl.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFProtocol.h"

@interface Girl : NSObject <GFProtocol>

@property(nonatomic,strong)NSString *name;

@end
