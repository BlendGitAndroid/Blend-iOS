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
    
    
    
    // dispatch_after : 核心函数，用于在指定时间后执行代码块在指定时间后执行代码块
    // - 2.
    // 第一个参数 dispatch_time(...) : 指定延迟执行的时间

    // - DISPATCH_TIME_NOW : 基准时间点，表示当前时刻
    // - (int64_t)(1.0 * NSEC_PER_SEC) : 延迟时间，这里是 1 秒
    //   - NSEC_PER_SEC : 常量，表示每秒包含的纳秒数 (1,000,000,000)
    //   - 1.0 * NSEC_PER_SEC : 计算出 1 秒的纳秒数
    //   - (int64_t) : 转换为 64 位整数类型
    // - 3.
    // 第二个参数 dispatch_get_main_queue() : 指定代码块执行的队列

    // - 这里是主队列 (UI 队列)，确保 UI 相关操作在主线程执行
    // - 4.
    // 第三个参数 ^{/* 代码块 */} : 要延迟执行的代码

    // - 这是一个匿名的 block 函数，包含实际要执行的逻辑
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











