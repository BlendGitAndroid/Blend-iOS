# Objective-C 内存管理四大经典问题

## 1. 📝 字符串为什么用 `copy`？

### 核心原因：**防止可变字符串被意外修改**

```objective-c
// 危险示例：使用 strong
@property (nonatomic, strong) NSString *userName;

NSMutableString *mutableName = [NSMutableString stringWithString:@"张三"];
obj.userName = mutableName;  // 此时 userName 指向 mutableName
[mutableName appendString:@"修改了"];  // userName 也被修改了！
NSLog(@"%@", obj.userName);  // 输出："张三修改了" ← 意外修改！

// 安全示例：使用 copy
@property (nonatomic, copy) NSString *userName;

NSMutableString *mutableName = [NSMutableString stringWithString:@"张三"];
obj.userName = mutableName;  // 自动调用 copy，生成不可变副本
[mutableName appendString:@"修改了"];  // 只修改原对象
NSLog(@"%@", obj.userName);  // 输出："张三" ← 安全！
```

### 性能优化技巧：
```objective-c
// setter 的实现对比
- (void)setUserName:(NSString *)userName {
    // strong 的实现
    // _userName = userName;  // 只是引用计数+1
    
    // copy 的实现（实际编译器生成）
    _userName = [userName copy];  
    // 如果是 NSString，copy 是浅拷贝（retain）
    // 如果是 NSMutableString，copy 是深拷贝（新对象）
}
```

### 特殊情况：
```objective-c
// 如果确定只接收不可变字符串，可用 strong（轻微性能提升）
@property (nonatomic, strong) NSString *fixedString;  // 自己保证不变

// 但最佳实践：总是用 copy！
// 1. 安全第一
// 2. 性能损失可忽略（对 NSString 只是 retain）
```

## 2. 🔄 Block 作为属性为什么用 `copy`？

### 核心原因：**Block 的内存管理需要**

```objective-c
// 错误示例：使用 strong（可能崩溃）
@property (nonatomic, strong) void (^completionBlock)(void);

- (void)setupBlock {
    int value = 10;
    self.completionBlock = ^{
        NSLog(@"Value: %d", value);  // 捕获局部变量
    };
    // Block 在栈上创建，方法结束后可能被释放！
}

// 正确示例：使用 copy
@property (nonatomic, copy) void (^completionBlock)(void);

- (void)setupBlock {
    int value = 10;
    self.completionBlock = ^{
        NSLog(@"Value: %d", value);  // copy 到堆上，长期保存
    };
}
```

### Block 的三种存储位置：

| 类型 | 存储位置 | 生命周期 | 是否需要 copy |
|------|----------|----------|--------------|
| **全局 Block** | 数据区 | 程序运行期间 | 不需要 |
| **栈 Block** | 栈内存 | 函数作用域内 | **必须 copy** |
| **堆 Block** | 堆内存 | 引用计数为0时 | 已 copy |

```objective-c
// 示例
void (^globalBlock)(void) = ^{ NSLog(@"Global"); };  // 全局Block
NSLog(@"%@", globalBlock);  // __NSGlobalBlock__

int x = 10;
void (^stackBlock)(void) = ^{ NSLog(@"%d", x); };  // 栈Block（捕获变量）
NSLog(@"%@", stackBlock);  // __NSStackBlock__

void (^heapBlock)(void) = [stackBlock copy];  // 堆Block
NSLog(@"%@", heapBlock);  // __NSMallocBlock__
```

### 现代 ARC 环境：
```objective-c
// ARC 下，编译器会自动 copy 栈 Block
// 但显式声明 copy 是良好习惯，也兼容 MRC

// 统一规范：Block 属性总是用 copy
typedef void (^CompletionHandler)(NSData *data, NSError *error);

@property (nonatomic, copy) CompletionHandler completionHandler;
```

## 3. 🤝 Delegate 为什么用 `weak`？

### 核心原因：**避免循环引用**

```objective-c
// 循环引用示例：两个对象相互强引用
@interface ViewController : UIViewController
@property (nonatomic, strong) id<UITableViewDelegate> delegate;  // ❌ 错误！
@end

@interface DataManager : NSObject <UITableViewDelegate>
@property (nonatomic, strong) ViewController *controller;  // ❌ 错误！
@end

// 结果：ViewController ←强引用→ DataManager
// 两者都无法释放，内存泄漏！

// 正确示例：使用 weak 打破循环
@interface ViewController : UIViewController
@property (nonatomic, weak) id<UITableViewDelegate> delegate;  // ✅ 正确
@end

// 关系：ViewController →弱引用→ DataManager
//        ↑_______________强引用↓
```

### 实际开发模式：
```objective-c
// 1. 定义协议
@protocol DataSourceDelegate <NSObject>
- (void)dataDidUpdate;
@end

// 2. 持有者使用 weak
@interface DataManager : NSObject
@property (nonatomic, weak) id<DataSourceDelegate> delegate;
@end

// 3. 委托者强引用持有者
@interface ViewController : UIViewController <DataSourceDelegate>
@property (nonatomic, strong) DataManager *dataManager;  // 强引用
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataManager = [[DataManager alloc] init];
    self.dataManager.delegate = self;  // weak 引用，不会增加引用计数
}
@end
```

### 特殊情况：**使用 unsafe_unretained**
```objective-c
// 和 weak 的区别：对象释放后不会自动置 nil
@property (nonatomic, unsafe_unretained) id<MyDelegate> delegate;

// 使用场景：
// 1. 性能敏感，不想有自动置 nil 的开销
// 2. 支持 iOS 4.3 之前（weak 是 iOS 5+）
// 3. 自己确保 delegate 的生命周期

// 风险：野指针！
// 对象释放后访问 delegate 会崩溃
```

## 4. ⚖️ `weak` 和 `assign` 的区别

### 核心区别：**对象释放后的处理方式**

| 特性 | **`weak`** | **`assign`** |
|------|------------|--------------|
| **适用对象** | Objective-C 对象 | 基本数据类型、C 结构体 |
| **对象释放后** | **自动置为 nil** | **保持原指针值（野指针）** |
| **内存管理** | ARC 自动管理 | 不参与引用计数 |
| **安全性** | 安全（访问 nil 安全） | 危险（可能访问已释放内存） |
| **使用场景** | 委托、弱引用、打破循环引用 | int、float、NSInteger、CGRect 等 |

### 代码对比：

```objective-c
// weak 示例：安全
@property (nonatomic, weak) NSObject *weakObj;

- (void)testWeak {
    NSObject *temp = [[NSObject alloc] init];
    self.weakObj = temp;  // weak 引用，不增加引用计数
    
    temp = nil;  // 对象释放
    NSLog(@"%@", self.weakObj);  // 输出：(null) ← 自动置 nil，安全！
}

// assign 示例：危险
@property (nonatomic, assign) NSObject *assignObj;  // ❌ 错误用法！

- (void)testAssign {
    NSObject *temp = [[NSObject alloc] init];
    self.assignObj = temp;  // assign 只是指针赋值
    
    temp = nil;  // 对象释放，但 assignObj 仍指向已释放内存
    NSLog(@"%@", self.assignObj);  // ❌ 可能崩溃！访问已释放对象
}
```

### 正确使用场景：

```objective-c
// 场景1：对象引用（用 weak）
@property (nonatomic, weak) id<UITableViewDelegate> delegate;
@property (nonatomic, weak) UIView *parentView;

// 场景2：基本数据类型（用 assign）
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) BOOL isFinished;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) int tag;

// 场景3：特殊情况（用 assign）
// 1. C 指针
@property (nonatomic, assign) const char *cString;

// 2. Core Foundation 对象（需桥接）
@property (nonatomic, assign) CFArrayRef cfArray;

// 3. 需要性能优化的对象引用（自己确保安全）
@property (nonatomic, unsafe_unretained) id unsafeRef;  // 类似 assign，但标明用途
```

### 内存管理原理：

```objective-c
// weak 的实现机制（简化理解）
// 1. 对象被 weak 引用时，系统维护一个弱引用表
// 2. 对象释放时，遍历弱引用表，将所有 weak 指针置为 nil
// 3. 访问 weak 属性时，系统自动检查并返回 nil 或对象

// assign 的实现机制
// 1. 只是简单的指针赋值
// 2. 不参与引用计数
// 3. 不跟踪对象生命周期
```

### 面试经典问题解答：

**Q: 为什么 delegate 用 weak 而不用 assign？**
```objective-c
// 错误答案：因为 assign 会有循环引用
// 循环引用是 strong 的问题，不是 assign 的问题！

// 正确答案：
// 1. weak 会在对象释放后自动置 nil，避免野指针崩溃
// 2. assign 不自动置 nil，对象释放后访问会崩溃
// 3. weak 是安全的，assign 是危险的（对对象而言）

// 示例证明：
// 即使使用 assign，也能打破循环引用：
@property (nonatomic, assign) id delegate;  // 打破循环
// 但对象释放后 delegate 是野指针，可能崩溃！

@property (nonatomic, weak) id delegate;  // 打破循环 + 安全
// 对象释放后 delegate 自动为 nil，访问安全
```

## 📋 总结表格

| 修饰符 | 主要用途 | 对象释放后 | 安全性 | 示例 |
|--------|----------|------------|--------|------|
| **copy** | 字符串、Block | 新对象独立 | 安全 | `@property (copy) NSString *name;` |
| **strong** | 对象所有权 | 由引用计数决定 | 安全（可能循环引用） | `@property (strong) NSArray *items;` |
| **weak** | 打破循环引用 | **自动置 nil** | 安全 | `@property (weak) id delegate;` |
| **assign** | 基本数据类型 | **保持原值** | 危险（对对象） | `@property (assign) CGFloat width;` |

## 🎯 黄金法则

1. **字符串属性** → **总是用 `copy`**
2. **Block 属性** → **总是用 `copy`**
3. **Delegate 属性** → **总是用 `weak`**
4. **基本数据类型** → **用 `assign`**
5. **对象引用** → **用 `strong`（所有权）或 `weak`（观察）**

## 💡 记忆口诀

```
字符串 copy 防修改，Block copy 堆上呆
Delegate weak 避循环，基本类型 assign 来
对象用 strong 所有权，观察引用 weak 戴
安全编码记心中，内存管理无祸灾
```