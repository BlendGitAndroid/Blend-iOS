//
//  CZArray.h
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef BOOL (^NewType)(char *country1,char *country2);

@interface CZArray : NSObject


- (void)sortWithCountries:(char *[])countries andLength:(int)len andCompareBlock:(NewType)compareBlock;

@end
