# 结合案例深入总结 OC 中的 Barrier

通过这个图片下载案例，我们来深入理解 `dispatch_barrier_async`。

## 一、案例的核心问题

### 原代码的问题：
```objc
// ❌ 问题：每次下载都创建新队列
- (void)downloadImage:(int)index {
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    // 每个下载都有自己的队列，barrier 无意义
}
```

### 修复后的核心：
```objc
// ✅ 正确：所有下载共享一个队列
@property (nonatomic, strong) dispatch_queue_t barrierQueue;

- (void)viewDidLoad {
    self.barrierQueue = dispatch_queue_create("hm.barrier", DISPATCH_QUEUE_CONCURRENT);
}

- (void)downloadImage:(int)index {
    dispatch_async(self.barrierQueue, ^{
        // 下载图片...
        
        dispatch_barrier_async(self.barrierQueue, ^{
            [self.photoList addObject:img];  // 屏障保护
        });
    });
}
```

## 二、Barrier 的本质：队列中的检查点

### 1. **执行时序图**
```
没有 Barrier：
任务1 ──┐
任务2 ──┼─ 并发执行 ──┤ 结果无序
任务3 ──┘

有 Barrier：
          ↓ 所有并发任务完成
任务1 ──┐               
任务2 ──┼─ 并发执行 ──┼─→ 等待完成
任务3 ──┘               
                     ↓ Barrier 独占执行
              添加图片到数组 ──┼─→ 等待完成
                     ↓ 后续任务
任务4 ──┐               
任务5 ──┼─ 并发执行 ──┤
任务6 ──┘
```

### 2. **案例中的实际效果**
```objc
// 假设3个下载任务几乎同时开始
dispatch_async(queue, ^{ 下载图片1 });  // 线程A
dispatch_async(queue, ^{ 下载图片2 });  // 线程B  
dispatch_async(queue, ^{ 下载图片3 });  // 线程C

// 每个下载完成后都会调用：
dispatch_barrier_async(queue, ^{
    [self.photoList addObject:img];
});

// 实际执行顺序：
1. 三个下载并发执行（可能在不同线程）
2. 下载1完成 → barrier1 进入队列等待
3. 下载2完成 → barrier2 进入队列等待  
4. 下载3完成 → barrier3 进入队列等待
5. 等所有并发任务完成后，barrier 按顺序执行
```

## 三、Barrier 的三大特性

### 1. **独占性**（关键特性）
```objc
// 普通 async：可能和其他任务并发
dispatch_async(queue, ^{ /* 任务A */ });
dispatch_async(queue, ^{ /* 任务B */ });  // 可能和A同时执行

// Barrier async：独占执行
dispatch_barrier_async(queue, ^{ /* 屏障任务 */ });
dispatch_async(queue, ^{ /* 后续任务 */ });  // 等屏障完成后才执行
```

### 2. **顺序保证**
```objc
// 屏障之前的任务全部完成后，才执行屏障
// 屏障完成之后，才执行后续任务

dispatch_async(queue, ^{ NSLog(@"A"); });
dispatch_async(queue, ^{ NSLog(@"B"); });
dispatch_barrier_async(queue, ^{ 
    NSLog(@"C - 屏障，等A、B完成才执行"); 
});
dispatch_async(queue, ^{ 
    NSLog(@"D - 等C完成后才执行"); 
});
```

### 3. **线程安全**
```objc
// 保护共享资源的经典模式
@interface ThreadSafeCache : NSObject
@property (nonatomic, strong) NSMutableDictionary *cache;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation ThreadSafeCache

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [NSMutableDictionary dictionary];
        _queue = dispatch_queue_create("cache.queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

// 读：并发（高性能）
- (id)objectForKey:(NSString *)key {
    __block id obj;
    dispatch_sync(self.queue, ^{  // sync 立即返回结果
        obj = self.cache[key];
    });
    return obj;
}

// 写：屏障（线程安全）
- (void)setObject:(id)obj forKey:(NSString *)key {
    dispatch_barrier_async(self.queue, ^{
        self.cache[key] = obj;  // 独占写入
    });
}

@end
```

## 四、Barrier 的适用场景

### 场景1：**读写锁模式**（最常用）
```objc
// 多读单写：多个线程可同时读，写时独占
- (id)readData {
    __block id data;
    dispatch_sync(self.queue, ^{ data = _data; });  // 并发读
    return data;
}

- (void)writeData:(id)newData {
    dispatch_barrier_async(self.queue, ^{
        _data = newData;  // 独占写
    });
}
```

### 场景2：**初始化操作**
```objc
// 确保初始化只执行一次，且线程安全
- (void)setup {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化代码
    });
}

// 等价于（手动实现）：
- (void)setup {
    dispatch_barrier_async(self.queue, ^{
        if (!_isInitialized) {
            // 初始化
            _isInitialized = YES;
        }
    });
}
```

### 场景3：**批量操作的原子性**
```objc
// 图片下载案例的优化版
- (void)downloadMultipleImages:(NSArray *)urls {
    dispatch_group_t group = dispatch_group_create();
    
    for (NSURL *url in urls) {
        dispatch_group_enter(group);
        dispatch_async(self.downloadQueue, ^{
            // 下载单个图片
            UIImage *image = [self downloadImageFromURL:url];
            
            // 使用屏障安全添加
            dispatch_barrier_async(self.downloadQueue, ^{
                [self.photoList addObject:image];
            });
            
            dispatch_group_leave(group);
        });
    }
    
    // 所有下载完成后执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有图片下载完成");
    });
}
```

## 五、Barrier 的使用规则

### ✅ 正确使用
```objc
// 1. 必须用于自定义并发队列
dispatch_queue_t queue = dispatch_queue_create("custom", DISPATCH_QUEUE_CONCURRENT);

// 2. 读写分离：读用普通 sync/async，写用 barrier
dispatch_async(queue, ^{ /* 读操作 */ });
dispatch_barrier_async(queue, ^{ /* 写操作 */ });

// 3. 需要结果时用 sync，不需要时用 async
dispatch_barrier_sync(queue, ^{ /* 需要立即结果 */ });     // 阻塞调用者
dispatch_barrier_async(queue, ^{ /* 不需要立即结果 */ });   // 不阻塞调用者
```

### ❌ 错误使用
```objc
// 1. 不能用于全局队列
dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{ }); // ❌ 未定义行为

// 2. 不能用于串行队列（无意义）
dispatch_queue_t serialQueue = dispatch_queue_create("serial", NULL);
dispatch_barrier_async(serialQueue, ^{ }); // ❌ 等同于普通 async

// 3. 不能用于主队列
dispatch_barrier_async(dispatch_get_main_queue(), ^{ }); // ❌ 未定义行为

// 4. 屏障中不要嵌套同步调用相同队列
dispatch_barrier_async(queue, ^{
    dispatch_sync(queue, ^{ /* ❌ 可能死锁 */ });
});
```

## 六、案例中的 Barrier 实战分析

### 原始意图 vs 实际效果
```objc
// 开发者想要的效果：
"并发下载图片 → 安全添加到数组"

// 原始代码的问题：
1. 每个下载创建独立队列 → barrier 无意义
2. 数组非线程安全 → 可能崩溃

// 修复后的效果：
1. 共享并发队列 → barrier 生效
2. barrier 保护数组 → 线程安全
3. 触摸时同步访问 → 数据一致性
```

### 性能对比
```objc
// 方案A：普通加锁（性能差）
@synchronized(self) {
    [self.photoList addObject:img];
}
// 每次添加都要加锁解锁，串行执行

// 方案B：Barrier（性能优）
dispatch_barrier_async(queue, ^{
    [self.photoList addObject:img];
});
// 下载并发执行，只有添加时短暂串行
```

## 七、Barrier 的内部实现原理

### 简化版实现
```objc
// 伪代码：理解 barrier 如何工作
void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block) {
    // 1. 检查是否是并发队列
    if (queue->type != CONCURRENT) {
        dispatch_async(queue, block); // 串行队列直接 async
        return;
    }
    
    // 2. 设置屏障标志
    queue->has_barrier = YES;
    
    // 3. 等待当前所有任务完成
    while (queue->active_tasks > 0) {
        // 自旋等待或线程挂起
    }
    
    // 4. 执行屏障任务（独占）
    block();
    
    // 5. 清除屏障标志，继续执行后续任务
    queue->has_barrier = NO;
}
```

## 八、Barrier 的最佳实践总结

### 1. **队列管理**
```objc
// 单例或属性持有，确保共享
@property (nonatomic, strong) dispatch_queue_t barrierQueue;

- (instancetype)init {
    self = [super init];
    if (self) {
        _barrierQueue = dispatch_queue_create("com.example.barrier", 
                                             DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
```

### 2. **读写模式模板**
```objc
// 读方法
- (id)readValue {
    __block id value;
    dispatch_sync(self.barrierQueue, ^{
        value = [_data copy]; // 返回副本更安全
    });
    return value;
}

// 写方法  
- (void)writeValue:(id)value {
    dispatch_barrier_async(self.barrierQueue, ^{
        _data = [value copy];
    });
}
```

### 3. **错误处理**
```objc
// 屏障任务中的异常处理
dispatch_barrier_async(queue, ^{
    @try {
        // 可能抛出异常的代码
        [self riskyOperation];
    } @catch (NSException *exception) {
        NSLog(@"屏障任务异常: %@", exception);
    } @finally {
        // 清理工作
    }
});
```

## 九、Barrier vs 其他同步机制

| 机制 | 优点 | 缺点 | 适用场景 |
|------|------|------|----------|
| **Barrier** | 高性能，读写分离 | 只能用于并发队列 | 多读单写的共享资源 |
| **@synchronized** | 简单易用 | 性能较差，可能死锁 | 简单的线程同步 |
| **NSLock** | 灵活可控 | 需要手动管理锁 | 复杂的锁逻辑 |
| **Serial Queue** | 绝对顺序执行 | 无法并发 | 任务必须顺序执行的场景 |
| **GCD Group** | 等待多个任务完成 | 不适合保护共享资源 | 并行任务同步点 |

## 总结

通过这个图片下载案例，我们深刻理解了 Barrier：

1. **Barrier 是队列的检查点**：等前面任务完成 → 独占执行 → 继续后面任务
2. **核心价值**：实现高效的**读写锁**模式
3. **必须共享队列**：不同队列的 barrier 毫无关联
4. **读写分离**：读并发（高性能），写独占（线程安全）
5. **使用场景**：缓存、数据库、共享数据结构的线程安全访问

记住这个**黄金法则**：
> 需要保护共享数据，且读多写少时，使用 Barrier + 并发队列