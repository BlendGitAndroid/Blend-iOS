//
//  Student.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudyProtocol.h"
#import "SBProtocol.h"


@interface Student : NSObject <StudyProtocol,SBProtocol>

@end
