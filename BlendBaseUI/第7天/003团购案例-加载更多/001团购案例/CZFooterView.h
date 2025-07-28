//
//  CZFooterView.h
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZFooterView;

@protocol CZFooterViewDelegate <NSObject, UIScrollViewDelegate>
@required
- (void)footerViewUpdateData:(CZFooterView *)footerView;
@end

@interface CZFooterView : UIView

+ (instancetype)footerView;
@property (nonatomic, weak) id<CZFooterViewDelegate> delegate;
@end
