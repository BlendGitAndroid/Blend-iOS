//
//  CZHeaderView.m
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZHeaderView.h"


@interface CZHeaderView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CZHeaderView

// 当这个方法被执行的时候就表示CZHeaderView已经从xib中创建好了，那么也就意味着在CZHeaderView
// 中的所有的子控件也都创建好了。所以就可以使用UIScrollView了。
- (void)awakeFromNib
{
    // 在这里就表示CZHeaderView已经从xib中创建好了。
    //self.scrollView.contentSize = ...;
}


+ (instancetype)headerView
{
    CZHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CZHeaderView" owner:nil options:nil] firstObject];
    return headerView;
}


@end
