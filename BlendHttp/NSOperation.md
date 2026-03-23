NSOperation 的作用和用法：

## NSOperation 基本概念

### 1. 什么是 NSOperation？
```objective-c
// NSOperation 是一个抽象基类，用于封装任务
// 它提供了面向对象的方式来管理并发任务
// 比 GCD 更高级，功能更丰富
```

### 2. NSOperation vs GCD 对比
```objective-c
// GCD（底层）
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    // 执行任务
});

// NSOperation（高级）
NSOperation *operation = [[NSBlockOperation alloc] init];
[operation addExecutionBlock:^{
    // 执行任务
}];
[[NSOperationQueue mainQueue] addOperation:operation];
```

## NSOperation 的核心作用

### 1. 任务封装
```objective-c
// 将复杂的任务封装成独立的操作对象
@interface DownloadOperation : NSOperation
@property (nonatomic, strong) NSURL *url;
- (instancetype)initWithURL:(NSURL *)url;
@end

// 使用
DownloadOperation *download = [[DownloadOperation alloc] initWithURL:someURL];
```

### 2. 状态管理
```objective-c
// NSOperation 自动管理 4 种状态：
@property (readonly, getter=isReady) BOOL ready;           // 准备就绪
@property (readonly, getter=isExecuting) BOOL executing;   // 正在执行
@property (readonly, getter=isFinished) BOOL finished;     // 已完成
@property (readonly, getter=isCancelled) BOOL cancelled;   // 已取消

// 检查状态
if (operation.isExecuting) {
    NSLog(@"任务正在执行");
}
```

### 3. 取消支持
```objective-c
// 启动任务
[operation start];

// 取消任务
[operation cancel];

// 在任务内部检查取消状态
- (void)main {
    if (self.isCancelled) return;
    
    // 执行任务...
    
    if (self.isCancelled) return;  // 再次检查
}
```

### 4. 依赖管理
```objective-c
// 创建操作
NSOperation *op1 = [[NSBlockOperation alloc] init];
NSOperation *op2 = [[NSBlockOperation alloc] init];
NSOperation *op3 = [[NSBlockOperation alloc] init];

// 设置依赖关系：op2 依赖 op1，op3 依赖 op2
[op2 addDependency:op1];
[op3 addDependency:op2];

// op1 → op2 → op3 顺序执行
```

### 5. 优先级设置
```objective-c
// 设置优先级
operation.queuePriority = NSOperationQueuePriorityVeryHigh;

// 优先级选项：
// NSOperationQueuePriorityVeryLow
// NSOperationQueuePriorityLow  
// NSOperationQueuePriorityNormal（默认）
// NSOperationQueuePriorityHigh
// NSOperationQueuePriorityVeryHigh
```

## NSOperation 的三种使用方式

### 1. NSBlockOperation（最简单）
```objective-c
// 创建块操作
NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
    NSLog(@"执行任务");
    // 下载文件、处理数据等
}];

// 添加更多执行块
[blockOp addExecutionBlock:^{
    NSLog(@"并发执行的另一个任务");
}];

// 执行
[blockOp start];
```

### 2. NSInvocationOperation（调用方法）
```objective-c
// 创建调用操作
NSInvocationOperation *invocationOp = 
    [[NSInvocationOperation alloc] initWithTarget:self 
                                         selector:@selector(downloadFile:) 
                                           object:fileURL];

// 执行
[invocationOp start];

// 对应的方法
- (void)downloadFile:(NSURL *)url {
    NSLog(@"下载文件: %@", url);
}
```

### 3. 自定义 NSOperation 子类（最灵活）
```objective-c
@interface CustomOperation : NSOperation
@property (nonatomic, strong) NSString *taskName;
@end

@implementation CustomOperation

- (void)main {
    @autoreleasepool {
        if (self.isCancelled) return;
        
        NSLog(@"开始执行: %@", self.taskName);
        
        // 执行具体任务
        [NSThread sleepForTimeInterval:2.0];  // 模拟耗时操作
        
        if (self.isCancelled) return;
        
        NSLog(@"完成执行: %@", self.taskName);
    }
}

@end
```

## NSOperationQueue 的配合使用

### 1. 创建操作队列
```objective-c
// 创建队列
NSOperationQueue *queue = [[NSOperationQueue alloc] init];

// 设置并发数
queue.maxConcurrentOperationCount = 3;  // 最多3个并发

// 设置队列名称
queue.name = @"DownloadQueue";
```

### 2. 添加操作到队列
```objective-c
// 方式1：添加操作对象
[queue addOperation:operation];

// 方式2：直接添加块
[queue addOperationWithBlock:^{
    NSLog(@"在队列中执行");
}];

// 方式3：批量添加
[queue addOperations:@[op1, op2, op3] waitUntilFinished:NO];
```

### 3. 队列控制
```objective-c
// 暂停队列
queue.suspended = YES;

// 恢复队列  
queue.suspended = NO;

// 取消所有操作
[queue cancelAllOperations];

// 等待所有操作完成
[queue waitUntilAllOperationsAreFinished];
```

## 实际应用场景

### 1. 图片下载管理
```objective-c
@interface ImageDownloadOperation : NSOperation
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, copy) void(^completion)(UIImage *image);
@end

// 使用
NSOperationQueue *imageQueue = [[NSOperationQueue alloc] init];
imageQueue.maxConcurrentOperationCount = 5;

ImageDownloadOperation *download = [[ImageDownloadOperation alloc] init];
download.imageURL = imageURL;
download.completion = ^(UIImage *image) {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });
};

[imageQueue addOperation:download];
```

### 2. 数据处理管道
```objective-c
// 创建处理链
NSOperation *fetchData = [NSBlockOperation blockOperationWithBlock:^{
    // 获取数据
}];

NSOperation *processData = [NSBlockOperation blockOperationWithBlock:^{
    // 处理数据
}];

NSOperation *saveData = [NSBlockOperation blockOperationWithBlock:^{
    // 保存数据
}];

// 设置依赖关系
[processData addDependency:fetchData];
[saveData addDependency:processData];

// 添加到队列
[queue addOperations:@[fetchData, processData, saveData] waitUntilFinished:NO];
```

### 3. 文件批量处理
```objective-c
NSOperationQueue *fileQueue = [[NSOperationQueue alloc] init];
fileQueue.maxConcurrentOperationCount = 2;

NSArray *fileURLs = @[url1, url2, url3, url4];

for (NSURL *url in fileURLs) {
    [fileQueue addOperationWithBlock:^{
        NSLog(@"处理文件: %@", url.lastPathComponent);
        
        // 处理文件逻辑
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 转换格式、压缩等操作
        [self processFileData:data];
    }];
}
```

## NSOperation 的优势总结

### 1. 相比 GCD 的优势
```objective-c
// ✅ NSOperation 优势：
// - 面向对象，易于管理
// - 支持取消操作
// - 支持依赖关系
// - 支持优先级
// - 状态管理完善
// - 可以重用操作对象

// ✅ GCD 优势：
// - 性能更高（底层）
// - 语法更简洁
// - 系统级别的调度
```

### 2. 使用场景建议
```objective-c
// 使用 NSOperation 的情况：
// - 需要取消功能
// - 需要依赖关系
// - 复杂的任务管理
// - 需要监控状态
// - 可重用的操作

// 使用 GCD 的情况：
// - 简单的异步任务
// - 对性能要求极高
// - 不需要复杂控制
```

## 总结

**NSOperation 的核心作用：**

1. **任务封装** - 将任务包装成对象
2. **状态管理** - 自动管理执行状态
3. **取消支持** - 内置取消机制
4. **依赖管理** - 任务间的依赖关系
5. **优先级** - 控制执行顺序
6. **队列管理** - 配合 NSOperationQueue 使用
7. **线程安全** - 自动处理线程安全

**NSOperation 是 iOS 并发编程的高级工具，适合复杂的任务管理场景！** 🎯