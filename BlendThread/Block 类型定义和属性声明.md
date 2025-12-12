这是 **Objective-C 中的 Block 类型定义和属性声明**语法。让我详细解释：

## 📚 语法分解

### 第一部分：`typedef` 定义 Block 类型
```objective-c
// 定义了一个名为 CompletionHandler 的类型
// 这个类型是一个 Block，它：
// 1. 没有返回值 (void)
// 2. 接受两个参数：NSData *data 和 NSError *error
typedef void (^CompletionHandler)(NSData *data, NSError *error);
```

**等价于**：
```objective-c
// 如果不使用 typedef，直接使用会很冗长
void (^completionBlock)(NSData *data, NSError *error);

// 使用 typedef 后，可以简化为：
CompletionHandler completionBlock;
```

### 第二部分：声明属性
```objective-c
// 声明一个名为 completionHandler 的属性
// 类型是 CompletionHandler（就是我们上面定义的 Block 类型）
// 修饰符：nonatomic, copy
@property (nonatomic, copy) CompletionHandler completionHandler;
```

## 🔍 详细解析

### 1. **Block 的基本语法**
```objective-c
// Block 变量的声明语法：
返回值类型 (^变量名)(参数类型1, 参数类型2, ...);

// 示例：
int (^multiplyBlock)(int, int);  // 接受两个int，返回int的Block
void (^simpleBlock)(void);       // 无参数无返回值的Block
NSString* (^processBlock)(NSString *input);  // 处理字符串的Block
```

### 2. **为什么要用 `typedef`？**
```objective-c
// 不使用 typedef（冗长、易错）：
@property (nonatomic, copy) void (^completionHandler)(NSData *data, NSError *error);
@property (nonatomic, copy) void (^successHandler)(NSData *data);
@property (nonatomic, copy) void (^failureHandler)(NSError *error);

// 使用 typedef（简洁、可重用）：
typedef void (^CompletionHandler)(NSData *data, NSError *error);
typedef void (^SuccessHandler)(NSData *data);
typedef void (^FailureHandler)(NSError *error);

@property (nonatomic, copy) CompletionHandler completionHandler;
@property (nonatomic, copy) SuccessHandler successHandler;
@property (nonatomic, copy) FailureHandler failureHandler;
```

### 3. **完整的类型定义模式**
```objective-c
// 1. 定义 Block 类型
typedef 返回值类型 (^类型名称)(参数列表);

// 2. 实际例子
typedef void (^VoidBlock)(void);                    // 无参数无返回值
typedef BOOL (^BoolBlock)(NSString *input);         // 返回BOOL，接受NSString
typedef NSArray* (^ArrayBlock)(NSDictionary *dict); // 返回数组，接受字典
typedef void (^DownloadBlock)(NSProgress *progress, NSData *data, NSError *error);
```

## 💻 实际使用示例

### 示例1：网络请求回调
```objective-c
// 1. 定义 Block 类型
typedef void (^NetworkCompletion)(NSData * _Nullable data, NSError * _Nullable error);

// 2. 声明属性
@property (nonatomic, copy) NetworkCompletion networkCompletion;

// 3. 定义方法
- (void)fetchDataFromURL:(NSURL *)url 
              completion:(NetworkCompletion)completion {
    // 保存 Block（需要 copy）
    self.networkCompletion = completion;
    
    // 发起网络请求...
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *error = nil;
        
        // 回到主线程调用 Block
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.networkCompletion) {
                self.networkCompletion(data, error);
            }
        });
    });
}

// 4. 调用时
[self fetchDataFromURL:url completion:^(NSData *data, NSError *error) {
    if (error) {
        NSLog(@"错误: %@", error);
    } else {
        NSLog(@"收到数据: %lu 字节", (unsigned long)data.length);
    }
}];
```

### 示例2：多个 Block 类型
```objective-c
// 定义多个相关的 Block 类型
typedef void (^SuccessHandler)(NSDictionary *response);
typedef void (^FailureHandler)(NSError *error);
typedef void (^ProgressHandler)(double progress);

// API 客户端类
@interface APIClient : NSObject
@property (nonatomic, copy) SuccessHandler successHandler;
@property (nonatomic, copy) FailureHandler failureHandler;
@property (nonatomic, copy) ProgressHandler progressHandler;

- (void)uploadFile:(NSURL *)fileURL
           success:(SuccessHandler)success
           failure:(FailureHandler)failure
          progress:(ProgressHandler)progress;
@end
```

## 🛡️ 为什么属性要用 `copy`？

```objective-c
// Block 的内存管理
void (^stackBlock)(void) = ^{ NSLog(@"栈Block"); };  // 创建在栈上
CompletionHandler heapBlock = [stackBlock copy];     // copy 到堆上

// 属性用 copy 的原因：
// 1. Block 可能创建在栈上（函数返回时会释放）
// 2. copy 将 Block 从栈复制到堆，保证长期存在
// 3. 即使使用 strong，编译器也会自动插入 copy
// 4. 显式声明 copy 是良好习惯，明确意图

// ARC 下实际等价于：
@property (nonatomic, strong) CompletionHandler completionHandler;  
// 编译器会自动 copy，但写 copy 更清晰
```

## 🔄 与函数指针的对比

```objective-c
// C 函数指针
typedef void (*FunctionPointer)(int);
FunctionPointer funcPtr = &someFunction;

// Objective-C Block
typedef void (^BlockType)(int);
BlockType block = ^(int value) {
    NSLog(@"值: %d", value);
};

// 关键区别：
// 1. Block 可以捕获上下文变量
// 2. Block 是对象，可以 retain/copy
// 3. 函数指针只是代码地址
```

## 📝 实际工程中的最佳实践

### 1. **标准化 Block 定义**
```objective-c
// 在公共头文件中定义
// CommonBlocks.h
typedef void (^VoidBlock)(void);
typedef void (^BoolCompletion)(BOOL success);
typedef void (^DataCompletion)(NSData * _Nullable data, NSError * _Nullable error);
typedef void (^ImageCompletion)(UIImage * _Nullable image, NSError * _Nullable error);
typedef void (^ArrayCompletion)(NSArray * _Nullable array, NSError * _Nullable error);

// 所有文件导入 CommonBlocks.h 后即可使用
```

### 2. **使用 nullable 注解（Swift 兼容）**
```objective-c
// 为 Swift 调用提供更好的类型信息
typedef void (^CompletionHandler)(NSData * _Nullable data, 
                                  NSError * _Nullable error) NS_SWIFT_NAME(CompletionHandler);
```

### 3. **避免循环引用**
```objective-c
typedef void (^CompletionHandler)(NSData *data, NSError *error);

@property (nonatomic, copy) CompletionHandler completionHandler;

- (void)doAsyncWork {
    // 正确：使用 weak-strong dance
    __weak typeof(self) weakSelf = self;
    self.completionHandler = ^(NSData *data, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;
        
        [strongSelf processData:data];  // 安全使用 self
    };
}
```

## ⚠️ 常见错误

### 错误1：忘记 copy
```objective-c
// 可能导致 Block 在栈上被释放
@property (nonatomic, strong) CompletionHandler handler;  // ❌ 应该用 copy

// 正确
@property (nonatomic, copy) CompletionHandler handler;    // ✅
```

### 错误2：循环引用
```objective-c
@property (nonatomic, copy) CompletionHandler handler;

- (void)setupHandler {
    // 错误：直接捕获 self
    self.handler = ^(NSData *data, NSError *error) {
        [self processData:data];  // ❌ 循环引用！
    };
    
    // 正确：weak-strong
    __weak typeof(self) weakSelf = self;
    self.handler = ^(NSData *data, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf processData:data];  // ✅ 安全
    };
}
```

## 🎯 总结

```objective-c
// 这个语法的完整解读：
// Step 1: 定义 Block 类型
// "创建一个叫 CompletionHandler 的类型，
// 它代表一个接受 NSData 和 NSError 参数，没有返回值的 Block"
typedef void (^CompletionHandler)(NSData *data, NSError *error);

// Step 2: 声明属性
// "声明一个 completionHandler 属性，
// 类型是 CompletionHandler，使用 copy 修饰"
@property (nonatomic, copy) CompletionHandler completionHandler;

// 等价效果：代码更简洁、可重用、类型安全
```

**记住这个模式**：
```
typedef 返回类型 (^类型名)(参数类型1 参数名1, 参数类型2 参数名2);
@property (nonatomic, copy) 类型名 属性名;
```

这是 Objective-C 中处理回调、异步操作的**标准且优雅的方式**，在 iOS/macOS 开发中极为常见。