//
//  CZFooterView.h
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

// @class CZFooterView; 看似是在自己的类文件中声明自己，这确实容易让人困惑。
// 但这是 Objective-C 中一种特殊的编程技巧，用于解决类接口中需要引用自身的问题。
// class CZFooterView; 是一个 前向声明 ，它告诉编译器：
// - CZFooterView 是一个类
// - 这个类会在后面正式声明
// - 现在只需要知道它是一个类存在即可
@class CZFooterView;

// 新建一个协议，用于代理
@protocol CZFooterViewDelegate <NSObject, UIScrollViewDelegate>
@required
// 解决协议方法中的类型引用问题，在 CZFooterView.h 中，我们先声明了协议 CZFooterViewDelegate
// 这个方法的参数需要使用 CZFooterView 类型，但此时类还未正式声明。
// 如果不使用@class修饰，编译器会报错，因为它无法知道CZFooterView的存在。
- (void)footerViewUpdateData:(CZFooterView *)footerView;
@end

@interface CZFooterView : UIView

+ (instancetype)footerView;

// ### 为什么这样设计？
// 1.
//    内存安全 ： weak 修饰避免循环引用导致的内存泄漏。循环引用的前提是视图控制器ViewController强引用了
//    CZFooterView，而同时自身作为代理赋值给delegate属性，导致了循环引用。
// 2.
//    解耦设计 ： id 类型 + 协议限定，实现了接口与实现的分离
// 3.
//    灵活性 ：任何实现了协议的对象都可以作为代理，不局限于特定类
// 4.
//    空指针保护 ： weak 引用在对象释放后自动置 nil ，避免向已释放对象发送消息导致崩溃
// 这是 iOS 开发中实现代理模式的标准方式，符合内存管理最佳实践。只要是实现了CZFooterViewDelegate的都可以
// 赋值给这个id
// 这里的delegate其实就是ViewControl对象
@property (nonatomic, weak) id<CZFooterViewDelegate> delegate;
@end
