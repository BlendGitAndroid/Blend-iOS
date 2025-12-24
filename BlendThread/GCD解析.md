# GCD（Grand Central Dispatch）Objective-C 全面总结

## 一、GCD 核心概念

### 1. **两个核心要素**
```objc
// 任务：Block
void (^task)(void) = ^{
    NSLog(@"执行任务");
};

// 队列：dispatch_queue_t
dispatch_queue_t queue = dispatch_queue_create("com.example.queue", NULL);
```

### 2. **两大关键决策**
```objc
// 执行方式
dispatch_sync(queue, ^{ /* 同步执行 */ });     // 同步
dispatch_async(queue, ^{ /* 异步执行 */ });    // 异步

// 队列类型
DISPATCH_QUEUE_SERIAL      // 串行队列
DISPATCH_QUEUE_CONCURRENT  // 并发队列
```

## 二、队列类型详解

### 1. **创建队列**
```objc
// 串行队列
dispatch_queue_t serialQueue = dispatch_queue_create("com.example.serial", DISPATCH_QUEUE_SERIAL);

// 并发队列  
dispatch_queue_t concurrentQueue = dispatch_queue_create("com.example.concurrent", DISPATCH_QUEUE_CONCURRENT);

// 主队列（UI相关操作）
dispatch_queue_t mainQueue = dispatch_get_main_queue();

// 全局队列（四种优先级）
dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
```

### 2. **队列优先级**
```objc
// 从高到低
DISPATCH_QUEUE_PRIORITY_HIGH           // 高优先级
DISPATCH_QUEUE_PRIORITY_DEFAULT        // 默认优先级（最常用）
DISPATCH_QUEUE_PRIORITY_LOW            // 低优先级  
DISPATCH_QUEUE_PRIORITY_BACKGROUND     // 后台优先级
```

## 三、执行方式组合效果

### 1. **串行队列 + 同步执行**
```objc
dispatch_queue_t serialQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);

for (int i = 0; i < 5; i++) {
    dispatch_sync(serialQueue, ^{
        NSLog(@"任务%d - 线程：%@", i, [NSThread currentThread]);
    });
}
```
**效果**：
- ❌ 不开新线程
- ✅ 在当前线程顺序执行
- ✅ 会阻塞当前线程

### 2. **串行队列 + 异步执行**
```objc
dispatch_queue_t serialQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);

for (int i = 0; i < 5; i++) {
    dispatch_async(serialQueue, ^{
        NSLog(@"任务%d - 线程：%@", i, [NSThread currentThread]);
    });
}
```
**效果**：
- ✅ 开1个新线程
- ✅ 顺序执行任务
- ❌ 不阻塞当前线程

### 3. **并发队列 + 同步执行**
```objc
dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);

for (int i = 0; i < 5; i++) {
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"任务%d - 线程：%@", i, [NSThread currentThread]);
    });
}
```
**效果**：
- ❌ 不开新线程
- ✅ 在当前线程顺序执行
- ✅ 会阻塞当前线程

### 4. **并发队列 + 异步执行**
```objc
dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);

for (int i = 0; i < 5; i++) {
    dispatch_async(concurrentQueue, ^{
        NSLog(@"任务%d - 线程：%@", i, [NSThread currentThread]);
    });
}
```
**效果**：
- ✅ 开多个新线程
- ✅ 并发执行任务
- ❌ 不阻塞当前线程

## 四、特殊队列的特殊情况

### 1. **主队列 + 同步执行 = 死锁**
```objc
// ❌ 错误：在主线程执行这段代码会造成死锁
dispatch_sync(dispatch_get_main_queue(), ^{
    NSLog(@"这行代码永远不会执行");
});
```

**死锁原因分析**：
```
1. 主线程正在执行当前代码（比如 viewDidLoad）
2. dispatch_sync 要求立即在主队列执行任务
3. 但主队列原则：主线程有代码在执行时不调度新任务
4. 互相等待 → 死锁
```

### 2. **主队列 + 异步执行**
```objc
// ✅ 正确：在主队列异步执行
dispatch_async(dispatch_get_main_queue(), ^{
    NSLog(@"在主线程更新UI");
});

// ✅ 正确：解决主队列同步死锁的方法
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    // 在子线程执行
    dispatch_sync(dispatch_get_main_queue(), ^{
        // 这时不会死锁，因为不在主线程
        NSLog(@"安全地在主线程同步执行");
    });
});
```

### 3. **全局队列（本质是并发队列）**
```objc
// 获取全局队列（第二个参数保留，传0）
dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

// 与手动创建并发队列的区别：
// 1. 全局队列没有名称（调试不便）
// 2. MRC中不需要手动release
// 3. 系统共享的队列
```

## 五、GCD 高级用法

### 1. **延迟执行**
```objc
// 延迟2秒执行
dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
dispatch_after(delayTime, dispatch_get_main_queue(), ^{
    NSLog(@"2秒后执行");
});
```

### 2. **一次性执行（单例常用）**
```objc
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static id instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}
```

### 3. **队列组（任务依赖）**
```objc
dispatch_group_t group = dispatch_group_create();

// 任务1
dispatch_group_async(group, globalQueue, ^{
    NSLog(@"任务1：下载图片");
});

// 任务2  
dispatch_group_async(group, globalQueue, ^{
    NSLog(@"任务2：处理图片");
});

// 所有任务完成后执行
dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"所有任务完成，更新UI");
});
```

### 4. **信号量（控制并发数）**
```objc
dispatch_semaphore_t semaphore = dispatch_semaphore_create(3); // 最多3个并发

for (int i = 0; i < 10; i++) {
    dispatch_async(globalQueue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        NSLog(@"执行任务%d", i);
        sleep(1);
        
        dispatch_semaphore_signal(semaphore);
    });
}
```

## 六、MRC 下的内存管理

```objc
// MRC 环境下需要手动管理内存
dispatch_queue_t queue = dispatch_queue_create("com.example.queue", NULL);

// 使用队列...

#if !__has_feature(objc_arc)
// 非 ARC 环境下需要释放
dispatch_release(queue);
#endif
```

## 七、最佳实践总结

### 1. **选择队列的黄金法则**
```objc
// UI 更新 → 主队列
dispatch_async(dispatch_get_main_queue(), ^{
    [self updateUI];
});

// 网络请求、文件读写 → 全局队列（高优先级）
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    [self downloadData];
});

// 数据库操作 → 串行队列（避免并发问题）
dispatch_queue_t dbQueue = dispatch_queue_create("com.example.database", DISPATCH_QUEUE_SERIAL);
dispatch_async(dbQueue, ^{
    [self saveToDatabase];
});
```

### 2. **避免常见错误**
```objc
// ❌ 错误1：主队列同步死锁
dispatch_sync(dispatch_get_main_queue(), ^{ /* ... */ });

// ❌ 错误2：在串行队列中同步调用自身（递归死锁）
dispatch_sync(serialQueue, ^{
    dispatch_sync(serialQueue, ^{ /* 死锁 */ });
});

// ✅ 正确：使用递归锁或并发队列解决递归问题
```

### 3. **调试技巧**
```objc
// 给队列设置标签便于调试
dispatch_queue_t queue = dispatch_queue_create("com.example.network", NULL);
dispatch_queue_set_specific(queue, "NetworkQueue", "YES", NULL);

// 检查是否在特定队列
if (dispatch_get_specific("NetworkQueue")) {
    NSLog(@"当前在NetworkQueue队列");
}
```

## 八、快速参考表

| 组合方式 | 是否开新线程 | 执行顺序 | 是否阻塞当前线程 |
|---------|-------------|----------|----------------|
| 串行队列 + 同步 | ❌ 否 | 顺序执行 | ✅ 是 |
| 串行队列 + 异步 | ✅ 1个线程 | 顺序执行 | ❌ 否 |
| 并发队列 + 同步 | ❌ 否 | 顺序执行 | ✅ 是 |
| 并发队列 + 异步 | ✅ 多个线程 | 并发执行 | ❌ 否 |
| 主队列 + 同步 | ❌（死锁） | - | - |
| 主队列 + 异步 | ❌ 否 | 顺序执行 | ❌ 否 |

记住核心原则：
- **同步**：在当前线程执行，会阻塞
- **异步**：可能在新线程执行，不阻塞  
- **串行**：一次一个任务
- **并发**：可同时多个任务