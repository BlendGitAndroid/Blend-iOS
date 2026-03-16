//
//  HMAPIConfig.h
//  08-模拟科技头条
//
//  API配置文件
//

#import <Foundation/Foundation.h>

// NS_ASSUME_NONNULL_BEGIN 是 Objective-C 中用于**空值标注（Nullability
// Annotations）**的宏，主要用于 Swift 与 Objective-C 的互操作。 基本含义
// - 作用 ：标记一段代码区域内，所有指针类型默认都是**非空（nonnull）**的
// - 配对使用 ：必须与 NS_ASSUME_NONNULL_END 成对出现
// - 目的 ：简化代码中的空值标注，减少重复书写
// 为什么需要这个宏
// 1. Swift 互操作

//    - Swift 对空值有严格的类型检查（ Optional vs Non-optional ）
//    - 这些标注帮助 Swift 正确识别 Objective-C 代码中的空值情况
//    - 未标注的指针在 Swift 中会被视为隐式解包可选类型（ Type! ）
// 2. 代码可读性

//    - 明确表达 API 设计者的意图
//    - 让调用者清楚知道哪些参数/返回值可以为 nil
// 3. 编译器检查

//    - Xcode 会根据标注进行静态分析
//    - 发现潜在的空值问题并发出警告
NS_ASSUME_NONNULL_BEGIN

/**
 *  API错误类型枚举

 这是 Objective-C 中定义**枚举类型**的标准写法，使用了 `NS_ENUM`
宏来创建类型安全的枚举。

## 详细解析

### 语法结构

```objc
typedef NS_ENUM(基础类型, 枚举名) {
    枚举值1 = 具体值,
    枚举值2 = 具体值,
    // ...
};
```

### 各部分组成

| 部分 | 说明 |
|------|------|
| `typedef` | 为类型定义别名 |
| `NS_ENUM` | Foundation 框架提供的宏，用于定义枚举 |
| `NSInteger` | 基础类型，枚举值的底层数据类型 |
| `HMAPIErrorCode` | 枚举类型的名称 |
| `{}` | 枚举值的集合 |

### 为什么使用 `NS_ENUM` 而不是普通 `enum`

#### 1. **类型安全**
```objc
// 普通 enum（不推荐）
enum {
    Error1 = 1,
    Error2 = 2
};
typedef int MyError;  // 只是 int 的别名，类型检查弱

// NS_ENUM（推荐）
typedef NS_ENUM(NSInteger, HMAPIErrorCode) {
    HMAPIErrorCodeNetworkFailure = -1000,
    // ...
};
// 编译器会严格检查类型
```

#### 2. **Swift 兼容性**
- `NS_ENUM` 定义的枚举在 Swift 中会自动转换为 `enum` 类型
- 支持 Swift 的 `switch` 语句和模式匹配

```swift
// Swift 中使用
let error: HMAPIErrorCode = .networkFailure
switch error {
case .networkFailure:
    print("网络失败")
case .serverError:
    print("服务器错误")
// ...
}
```

#### 3. **IDE 支持**
- 更好的代码补全
- 更好的文档提示

### 枚举值命名规范

```objc
HMAPIErrorCodeNetworkFailure
// ↑前缀      ↑具体描述
```

- **前缀**：与枚举类型名一致（`HMAPIErrorCode`）
- **驼峰命名**：首字母大写，单词间无下划线

### 实际使用示例

```objc
// 定义枚举变量
HMAPIErrorCode errorCode = HMAPIErrorCodeNetworkFailure;

// 函数参数
- (void)handleError:(HMAPIErrorCode)errorCode {
    switch (errorCode) {
        case HMAPIErrorCodeNetworkFailure:
            NSLog(@"网络连接失败");
            break;
        case HMAPIErrorCodeServerError:
            NSLog(@"服务器错误");
            break;
        // ...
    }
}

// 比较
if (errorCode == HMAPIErrorCodeNetworkFailure) {
    // 处理网络错误
}
```

### 对比：旧写法 vs 新写法

```objc
// ❌ 旧写法（C 风格）
typedef enum {
    ErrorNetwork = -1000,
    ErrorServer = -1001
} ErrorType;

// ✅ 新写法（推荐）
typedef NS_ENUM(NSInteger, HMAPIErrorCode) {
    HMAPIErrorCodeNetworkFailure = -1000,
    HMAPIErrorCodeServerError = -1001
};
```

### 总结

`NS_ENUM` 是 Objective-C 中定义枚举的**现代标准写法**，它提供了：
- 更强的类型安全
- 更好的 Swift 互操作性
- 更清晰的代码结构
- 更好的 IDE 支持

这是 Apple 官方推荐的方式，在现代 iOS/macOS 开发中应该优先使用。
 */
typedef NS_ENUM(NSInteger, HMAPIErrorCode) {
    HMAPIErrorCodeNetworkFailure = -1000,  // 网络连接失败
    HMAPIErrorCodeServerError = -1001,     // 服务器错误
    HMAPIErrorCodeDataParseError = -1002,  // 数据解析错误
    HMAPIErrorCodeInvalidResponse = -1003, // 无效响应
};

/**
 *  API配置类
 */
@interface HMAPIConfig : NSObject

// 基础URL配置
// class表示类属性，属于类本身
@property(class, nonatomic, readonly) NSString *baseURL;
@property(class, nonatomic, readonly) NSString *hotNewsURL;

// 请求超时配置
@property(class, nonatomic, readonly) NSTimeInterval requestTimeout;

// 错误处理
+ (NSError *)errorWithCode:(HMAPIErrorCode)code message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
