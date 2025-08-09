//
//  CZWeiboFrame.h
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

// 在这里定义的宏
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]
/** 
在Objective-C中，`#import`和`@class`的使用场景有明确区分，主要基于是否需要访问类的具体实现细节：

### 1. 使用`@class`的场景（头文件中）
**核心原则**：仅需声明类的存在，不依赖其具体实现时。
- **声明属性/变量**：如`@property (nonatomic, strong) CZWeibo *weibo;`，只需知道`CZWeibo`是类类型，不需要其内部属性或方法。
- **避免循环引用**：即使当前没有循环引用，使用`@class`也是预防性措施，防止未来代码变更时出现依赖循环。
- **优化编译性能**：减少头文件嵌套引入，降低编译时的依赖解析成本，加快编译速度。

### 2. 使用`#import`的场景（实现文件中）
**核心原则**：需要访问类的具体属性、方法或实现细节时。
- **访问成员**：如在`CZWeiboFrame.m`中需要读取`weibo.text`、`weibo.name`等属性，必须导入`CZWeibo.h`以获取完整声明。
- **调用方法**：如果需要调用类的方法（如`[weibo someMethod]`），必须通过`#import`引入头文件。

### 3. 实战判断技巧
- **头文件中**：优先使用`@class`，除非必须继承该类（`@interface MyClass : ParentClass`）或实现其协议（`@interface MyClass : NSObject <ParentProtocol>`）。
- **实现文件中**：根据实际需求导入所需头文件，确保能访问到所有必要的成员。

### 案例分析（当前项目）
- `CZWeiboFrame.h`中使用`@class CZWeibo;`：仅声明`CZWeibo`类存在，用于定义`weibo`属性，无需其具体实现。
- `CZWeiboFrame.m`中使用`#import "CZWeibo.h"`：需要访问`weibo`的`text`、`name`等属性，必须导入完整声明。
- `CZWeibo.h`未引入`CZWeiboFrame`：因为`CZWeibo`类不需要知道`CZWeiboFrame`的存在，符合单向依赖原则。

这种区分使用的方式，既保证了代码的正确性，又优化了编译性能，是Objective-C开发中的标准实践。   
*/
@class CZWeibo;
@interface CZWeiboFrame : NSObject

// 保存原始数据的
@property (nonatomic, strong) CZWeibo *weibo;

// 用来保存头像的frame
@property (nonatomic, assign, readonly) CGRect iconFrame;

// 昵称的frame
@property (nonatomic, assign, readonly) CGRect nameFrame;


// vip的frame
@property (nonatomic, assign, readonly) CGRect vipFrame;

// 正文的frame
@property (nonatomic, assign, readonly) CGRect textFrame;

//配图的frame
@property (nonatomic, assign, readonly) CGRect picFrame;

// 行高
@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end
