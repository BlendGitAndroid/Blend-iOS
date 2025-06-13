//
//  GFProtocol.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>


//遵守这个协议的东西都可以当男孩子的女盆有.


/**
 *  女朋友协议,只要遵守这个协议的东西都可以作为男孩子的女朋友.
 */
@protocol GFProtocol <NSObject>

@required
- (void)wash;
- (void)cook;

@optional
- (void)job;



@end
