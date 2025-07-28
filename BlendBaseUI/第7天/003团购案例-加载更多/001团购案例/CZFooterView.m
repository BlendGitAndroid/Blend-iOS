//
//  CZFooterView.m
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZFooterView.h"

@interface CZFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet UIView *waitingView;
- (IBAction)btnLoadMoreClick;
@end


@implementation CZFooterView

+ (instancetype)footerView
{
    CZFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"CZFooterView" owner:nil options:nil] lastObject];
    return footerView;
}


/**
*  加载更多按钮的单击事件
*/
- (IBAction)btnLoadMoreClick {
    // 1. 隐藏"加载更多"按钮
    self.btnLoadMore.hidden = YES;
    
    // 2. 显示"等待指示器"所在的那个UIView
    self.waitingView.hidden = NO;
    
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 3. 调用代理方法实现下面的功能
        // 调用footerViewUpdateData方法之前, 为了保证调用不出错, 所以要先判断一下代理对象是否真的实现了这个方法, 如果实现了这个方法再调用, 否则不调用.
        if ([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]) {
            // 3. 增加一条数据
            // 3.1 创建一个模型对象
            // 3.2 把模型对象加到控制器的goods集合当中
            // 4. 刷新UITableView
            [self.delegate footerViewUpdateData:self];
        }
        
        
        // 4. 显示"加载更多"按钮
        self.btnLoadMore.hidden = NO;
        
        // 5. 隐藏"等待指示器"所在的那个UIView
        self.waitingView.hidden = YES;
        
    });
    
    
    
    
    
    
}
@end











