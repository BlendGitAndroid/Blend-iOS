# `dispatch_once` 单例模式详解

这是一个 Objective-C 中最常用的**线程安全的单例实现**。让我逐行解释：

## 一、代码结构分析

```objc
+ (instancetype)sharedInstance {
    // 1. 声明一个静态的 onceToken
    static dispatch_once_t onceToken;
    
    // 2. 声明一个静态的 instance 变量
    static id instance = nil;
    
    // 3. 使用 dispatch_once 确保初始化代码只执行一次
    dispatch_once(&onceToken, ^{
        // 这个 Block 在整个应用生命周期内只会执行一次
        instance = [[self alloc] init];
    });
    
    // 4. 返回单例实例
    return instance;
}
```

## 二、核心组件解析

### 1. **`dispatch_once_t onceToken`**
```objc
static dispatch_once_t onceToken;
```
- `dispatch_once_t` 是一个长整型变量（本质是 `long`）
- `static` 关键字让它**只初始化一次**，保存在静态区
- 第一次调用时值为 0，执行后会被设为非 0
- 作用：标记初始化是否已经完成

### 2. **`static id instance = nil`**
```objc
static id instance = nil;
```
- `static`：静态变量，只会初始化一次
- `id`：Objective-C 中的通用对象指针（类似 `NSObject *`）
- 初始化为 `nil`，第一次调用时才创建对象
- 这个变量在整个程序运行期间都存在

### 3. **`dispatch_once` 函数**
```objc
dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
});
```
这是最核心的部分，**确保初始化代码只执行一次**。

## 三、`dispatch_once` 的工作原理

### 工作原理示意图：
```
第一次调用 sharedInstance():
┌─────────────────────────────────────┐
│ onceToken = 0                        │
│ ↓                                    │
│ dispatch_once 检查 onceToken == 0    │
│ ↓                                    │
│ 执行 Block：创建对象                  │
│ ↓                                    │
│ onceToken 被设为非 0 值               │
│ ↓                                    │
│ 返回 instance                       │
└─────────────────────────────────────┘

第二次及以后调用 sharedInstance():
┌─────────────────────────────────────┐
│ onceToken ≠ 0                        │
│ ↓                                    │
│ dispatch_once 检查 onceToken ≠ 0     │
│ ↓                                    │
│ 跳过 Block，不执行初始化代码          │
│ ↓                                    │
│ 直接返回 instance                   │
└─────────────────────────────────────┘
```

### 伪代码实现：
```objc
// dispatch_once 的简化实现逻辑
void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block) {
    // 1. 使用内存屏障和原子操作检查 predicate
    if (*predicate == 0) {
        // 2. 如果是0（第一次调用），执行block
        block();
        
        // 3. 执行完成后，将 predicate 设为非0
        *predicate = 1;  // 实际实现更复杂，使用原子操作
    }
    // 4. 如果不是0，什么也不做
}
```

## 四、线程安全性分析

### 多线程调用场景：
```objc
// 假设两个线程几乎同时调用 sharedInstance
// 线程A                         // 线程B
sharedInstance()                 sharedInstance()
    ↓                                ↓
检查 onceToken == 0              检查 onceToken == 0
    ↓                                ↓
执行 dispatch_once                等待...
    ↓                                ↓
创建对象                          等待...
    ↓                                ↓
onceToken = 1                     发现 onceToken == 1
    ↓                                ↓
返回 instance                     直接返回 instance（不重复创建）
```

**关键点**：
1. `dispatch_once` 内部使用了**锁和内存屏障**，保证线程安全
2. 即使多个线程同时调用，初始化代码也只会执行一次
3. 后续调用直接返回已创建的对象，无性能损耗

## 五、与传统单例实现的对比

### 1. **传统方法（非线程安全）**
```objc
// ❌ 非线程安全版本
+ (instancetype)sharedInstance {
    static id instance = nil;
    
    if (instance == nil) {
        instance = [[self alloc] init];  // 多线程可能重复创建
    }
    
    return instance;
}
```

**问题**：如果两个线程同时进入 `if (instance == nil)`，会创建两个对象！

### 2. **加锁版本（性能较差）**
```objc
// ✅ 线程安全但性能差
+ (instancetype)sharedInstance {
    static id instance = nil;
    static NSLock *lock = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSLock alloc] init];
    });
    
    [lock lock];
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    [lock unlock];
    
    return instance;
}
```

**问题**：每次调用都要加锁解锁，影响性能。

### 3. **`dispatch_once` 版本（最佳实践）**
```objc
// ✅ 线程安全且性能最佳
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static id instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}
```

**优势**：
- 线程安全
- 只在第一次调用时有微小性能开销
- 后续调用几乎零开销
- 代码简洁

## 六、实际使用示例

### 1. **创建单例类**
```objc
// UserManager.h
@interface UserManager : NSObject

+ (instancetype)sharedManager;
- (void)loginWithUsername:(NSString *)username;

@end

// UserManager.m
@implementation UserManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static UserManager *instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[UserManager alloc] init];
        // 可以在这里做一些初始化配置
        [instance setup];
    });
    
    return instance;
}

- (void)setup {
    // 初始化代码
    NSLog(@"UserManager 初始化完成");
}

- (void)loginWithUsername:(NSString *)username {
    NSLog(@"用户登录：%@", username);
}

@end
```

### 2. **使用单例**
```objc
// 在代码的任何地方使用
UserManager *manager = [UserManager sharedManager];
[manager loginWithUsername:@"张三"];

// 再次获取，得到的是同一个对象
UserManager *manager2 = [UserManager sharedManager];
NSLog(@"manager == manager2? %@", manager == manager2 ? @"YES" : @"NO");  // 输出 YES
```

## 七、常见问题解答

### Q1: 为什么要有 `static` 关键字？
**A**：`static` 让变量在函数多次调用间保持值不变，且只在第一次调用时初始化。

### Q2: `dispatch_once` 比锁快在哪里？
**A**：
- 第一次调用：有加锁和创建对象开销
- 后续调用：只有一次内存读取（检查 `onceToken`），比加锁快得多

### Q3: 能在 Block 里做复杂初始化吗？
**A**：可以，但注意：
```objc
dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    
    // 可以执行复杂的初始化
    [instance loadConfig];
    [instance setupDatabase];
    [instance preloadData];  // 注意：这会延长第一次调用时间
});
```

## 八、Swift 版本对比

```swift
// Swift 中的单例（更简洁）
class UserManager {
    static let shared = UserManager()
    
    private init() {
        // 初始化代码
        print("UserManager 初始化")
    }
    
    func login(username: String) {
        print("用户登录：\(username)")
    }
}

// 使用
UserManager.shared.login(username: "张三")
```

## 总结

`dispatch_once` 单例模式是 Objective-C 中的**黄金标准**，它：
1. ✅ **100% 线程安全**
2. ✅ **高性能**（后续调用几乎无开销）
3. ✅ **代码简洁**（只需几行代码）
4. ✅ **Apple 官方推荐**的方式

记住这个模式，在需要单例时直接套用这个模板即可。