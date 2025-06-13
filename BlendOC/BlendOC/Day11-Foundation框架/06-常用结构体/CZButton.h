//
//  CZButton.h
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  按钮类
 */
@interface CZButton : NSObject

///**
// *  当前按钮对象的坐标
// */
//@property(nonatomic,assign)CGPoint point;
//
//
///**
// *  当前按钮的大小.
// */
//@property(nonatomic,assign)CGSize size;


@property(nonatomic,assign)CGRect frame;


/**
 *  当前按钮对象上得文本.
 */
@property(nonatomic,strong)NSString *text;



- (void)show;

- (void)hide;



@end
