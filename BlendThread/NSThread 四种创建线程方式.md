# NSThread 四种创建线程方式详解

## 📋 四种方式对比

| 方式 | 方法 | 特点 | 控制权 | 使用场景 |
|------|------|------|--------|----------|
| 方式1 | `[[NSThread alloc] initWithTarget:selector:object:]` + `start` | **最灵活**，可控制线程属性 | 完全控制 | 需要配置线程属性 |
| 方式2 | `[NSThread detachNewThreadSelector:toTarget:withObject:]` | **自动启动**，不可控制 | 无控制 | 简单后台任务 |
| 方式3 | `[self performSelectorInBackground:withObject:]` | **最简洁**，自动创建启动 | 无控制 | 快速后台执行 |
| 方式4 | 同方式1，但**带参数传递** | 灵活且**可传参** | 完全控制 | 需要传递数据的任务 |

## 🔍 详细解释

### 方式1：**手动创建并启动**（推荐）
```objective-c
NSThread *thread = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(demo)
                                             object:nil];
[thread start];  // 手动启动
```

**特点**：
- 创建后不会自动启动，需要手动调用 `start`
- 可以设置线程属性（名称、优先级等）
- 可以获取线程对象引用，后续可控制

**示例**：
```objective-c
NSThread *thread = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(downloadImage:)
                                             object:imageURL];
thread.name = @"图片下载线程";  // 设置线程名称
thread.threadPriority = 0.8;   // 设置优先级（0.0-1.0）
[thread start];
```

### 方式2：**分离新线程（自动启动）**
```objective-c
[NSThread detachNewThreadSelector:@selector(demo)
                         toTarget:self
                       withObject:nil];
```

**特点**：
- 立即创建并**自动启动**线程
- 无法获取线程对象引用
- 无法设置线程属性
- 线程执行完毕后自动销毁

**适用场景**：简单的、一次性的后台任务

### 方式3：**后台执行器（最简洁）**
```objective-c
[self performSelectorInBackground:@selector(demo)
                       withObject:nil];
```

**特点**：
- **最简洁**的写法
- 自动创建、启动线程
- 无法控制线程属性
- 本质是方式2的封装

**等效于**：
```objective-c
// performSelectorInBackground 内部实现类似：
[NSThread detachNewThreadSelector:@selector(demo)
                         toTarget:self
                       withObject:nil];
```

### 方式4：**带参数的线程创建**（重要）
```objective-c
NSThread *thread = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(demo:)
                                             object:@"蒋卫生"];  // 传递参数
[thread start];
```

**关键点**：
- `object:` 参数会传递给目标方法的第一个参数
- 方法签名必须匹配：`- (void)demo:(id)param`
- 只能传递**一个参数**，多个参数需使用字典或数组包装

## 💡 实际使用示例

### 示例1：下载任务（带进度回调）
```objective-c
// 创建线程
NSThread *downloadThread = [[NSThread alloc] initWithTarget:self
                                                   selector:@selector(downloadTask:)
                                                     object:@{@"url": imageURL, 
                                                             @"completion": completionBlock}];
downloadThread.name = @"Download Thread";
[downloadThread start];

// 执行方法
- (void)downloadTask:(NSDictionary *)params {
    NSURL *url = params[@"url"];
    void (^completion)(UIImage *) = params[@"completion"];
    
    // 下载逻辑...
    UIImage *image = [self downloadImageFromURL:url];
    
    // 回到主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completion) completion(image);
    });
}
```

### 示例2：对比四种方式
```objective-c
// 方式1：灵活控制
NSThread *thread1 = [[NSThread alloc] initWithTarget:self 
                                            selector:@selector(task1) 
                                              object:nil];
thread1.name = @"Thread-1";
[thread1 start];

// 方式2：快速启动
[NSThread detachNewThreadSelector:@selector(task2) 
                         toTarget:self 
                       withObject:nil];

// 方式3：最简洁
[self performSelectorInBackground:@selector(task3) 
                       withObject:nil];

// 方式4：带参数
NSThread *thread4 = [[NSThread alloc] initWithTarget:self
                                            selector:@selector(taskWithName:)
                                              object:@"参数线程"];
[thread4 start];
```

## ⚠️ 注意事项

### 1. **线程安全**
```objective-c
// 错误：非线程安全
- (void)unsafeDemo {
    self.counter = self.counter + 1;  // 可能发生竞态条件
}

// 正确：使用锁或原子操作
@property (atomic) NSInteger counter;  // 使用atomic
// 或
@synchronized(self) {
    self.counter = self.counter + 1;
}
```

### 2. **内存管理**
```objective-c
// 在线程方法中需要创建 autoreleasepool
- (void)backgroundTask {
    @autoreleasepool {
        // 大量临时对象创建...
        for (int i = 0; i < 10000; i++) {
            NSString *temp = [NSString stringWithFormat:@"item%d", i];
            // 使用temp...
        }
    }  // 自动释放池结束，清理内存
}
```

### 3. **UI更新必须回主线程**
```objective-c
- (void)backgroundTask {
    // 后台处理数据
    NSArray *results = [self processData];
    
    // 错误：在后台线程更新UI（会崩溃或显示异常）
    // self.label.text = @"完成";
    
    // 正确：回到主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = @"处理完成";
        self.tableView.dataSource = results;
    });
}
```

## 🎯 使用建议

### **推荐使用方式1**（当需要NSThread时）：
- 可以设置线程属性
- 可以控制线程生命周期
- 代码意图更清晰

### **实际开发中更推荐使用GCD**：
```objective-c
// 代替 NSThread 的更好选择
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    // 后台任务
    [self processData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 更新UI
        [self updateUI];
    });
});
```

## 📊 总结表格

| 特性 | 方式1 | 方式2 | 方式3 | 方式4 |
|------|-------|-------|-------|-------|
| 自动启动 | ❌ 需手动start | ✅ | ✅ | ❌ 需手动start |
| 可获取引用 | ✅ | ❌ | ❌ | ✅ |
| 可设置属性 | ✅ | ❌ | ❌ | ✅ |
| 可传参数 | ❌（可传nil） | ❌（可传nil） | ❌（可传nil） | ✅ |
| 代码简洁度 | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐ |
| 控制灵活性 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |

s