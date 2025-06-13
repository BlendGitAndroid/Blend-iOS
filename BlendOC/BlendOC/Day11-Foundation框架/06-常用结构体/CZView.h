//
//  CZView.h
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CZButton.h"


/**
 *  iOS界面
 */
@interface CZView : NSObject

@property(nonatomic,assign)CGPoint point;

@property(nonatomic,assign)CGSize size;

@property(nonatomic,strong)NSMutableArray *subViews;





@end
