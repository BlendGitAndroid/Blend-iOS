这里调用 `[self.session finishTasksAndInvalidate]` 是为了**正确清理网络资源和避免内存泄漏**。

## 原因分析

### 1. NSURLSession 的内存管理问题
```objective-c
// NSURLSession 存在强引用循环的风险：
// session 持有 delegate → delegate 持有 session
// 如果不手动断开，会导致内存泄漏
```

### 2. finishTasksAndInvalidate 的作用
```objective-c
// 这个方法会：
// 1. 完成所有正在进行的任务
// 2. 不再接受新任务
// 3. 断开与 delegate 的连接
// 4. 释放 session 相关资源
```

## 详细说明

### 1. 内存泄漏的原因
```objective-c
@interface DownloadViewController : UIViewController <NSURLSessionDelegate>
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation DownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ⚠️ 这里会产生循环引用
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config 
                                                 delegate:self  // session 持有 self
                                            delegateQueue:nil];
    // self 持有 session，形成循环引用
}

// ❌ 如果没有 invalidate，控制器永远不会被释放
- (void)dealloc {
    NSLog(@"DownloadViewController dealloc"); // 这行永远不会执行
}

@end
```

### 2. 正确的清理方式
```objective-c
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    <!-- isMovingFromParentViewController 是 UIViewController 的一个只读属性，用来判断当前控制器是否正在从父控制器中移除。 -->
    if (self.isMovingFromParentViewController || self.isBeingDismissed) {
        // 只在真正离开时清理，避免在 push 其他页面时误清理
        [self.session finishTasksAndInvalidate];
        self.session = nil;
    }
}
```

## finishTasksAndInvalidate vs invalidateAndCancel

### 1. finishTasksAndInvalidate（温和清理）
```objective-c
[session finishTasksAndInvalidate];

// 行为：
// - 等待当前任务完成
// - 完成后断开 delegate 连接
// - 适用于正常退出场景
```

### 2. invalidateAndCancel（强制清理）
```objective-c
[session invalidateAndCancel];

// 行为：
// - 立即取消所有任务
// - 立即断开 delegate 连接
// - 适用于紧急退出场景
```

## 完整的生命周期管理

### 最佳实践示例
```objective-c
@interface NetworkViewController : UIViewController <NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSMutableArray *downloadTasks;
@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSession];
    self.downloadTasks = [NSMutableArray array];
}

- (void)setupSession {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 30.0;
    
    self.session = [NSURLSession sessionWithConfiguration:config 
                                                 delegate:self 
                                            delegateQueue:nil];
}

- (void)startDownload:(NSURL *)url {
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:url];
    [self.downloadTasks addObject:task];
    [task resume];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 检查是否真正离开这个控制器
    if (self.isMovingFromParentViewController || 
        self.isBeingDismissed || 
        self.navigationController.isBeingDismissed) {
        
        NSLog(@"清理网络资源...");
        [self cleanupNetworkResources];
    }
}

- (void)cleanupNetworkResources {
    // 1. 停止所有任务
    for (NSURLSessionTask *task in self.downloadTasks) {
        [task cancel];
    }
    [self.downloadTasks removeAllObjects];
    
    // 2. 清理 session
    [self.session finishTasksAndInvalidate];
    self.session = nil;
}

- (void)dealloc {
    NSLog(@"✅ NetworkViewController dealloc"); // 现在可以正常释放
    
    // 保险措施：确保 session 被清理
    if (self.session) {
        [self.session invalidateAndCancel];
    }
}

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session 
      downloadTask:(NSURLSessionDownloadTask *)downloadTask 
didFinishDownloadingToURL:(NSURL *)location {
    
    // 任务完成后从数组中移除
    [self.downloadTasks removeObject:downloadTask];
    
    NSLog(@"下载完成，剩余任务: %lu", (unsigned long)self.downloadTasks.count);
}

- (void)URLSession:(NSURLSession *)session 
              task:(NSURLSessionTask *)task 
didCompleteWithError:(NSError *)error {
    
    [self.downloadTasks removeObject:task];
    
    if (error) {
        NSLog(@"任务失败: %@", error.localizedDescription);
    }
}

@end
```

## 不同场景的清理策略

### 1. 普通页面退出
```objective-c
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 温和清理：等待任务完成
    [self.session finishTasksAndInvalidate];
}
```

### 2. 应用进入后台
```objective-c
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // 对于前台 session，应该清理
    for (UIViewController *vc in self.viewControllers) {
        if ([vc respondsToSelector:@selector(cleanupNetworkResources)]) {
            [vc cleanupNetworkResources];
        }
    }
}
```

### 3. 紧急情况处理
```objective-c
- (void)emergencyCleanup {
    // 立即取消所有任务
    [self.session invalidateAndCancel];
    self.session = nil;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self emergencyCleanup];
}
```

## 后台 Session 的特殊处理

### 后台 Session 不需要立即清理
```objective-c
// 后台 session 应该保持活跃
@property (nonatomic, strong) NSURLSession *backgroundSession;

- (void)setupBackgroundSession {
    NSURLSessionConfiguration *config = 
        [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.app.background"];
    
    self.backgroundSession = [NSURLSession sessionWithConfiguration:config 
                                                           delegate:self 
                                                      delegateQueue:nil];
    
    // 后台 session 通常不在 viewWillDisappear 中清理
}
```

## 常见错误

### ❌ 错误做法
```objective-c
// 1. 没有清理 session
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 忘记清理，导致内存泄漏
}

// 2. 在错误的时机清理
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.session invalidateAndCancel]; // 太晚了，可能已经造成泄漏
}

// 3. 重复清理
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.session finishTasksAndInvalidate];
}

- (void)dealloc {
    [self.session finishTasksAndInvalidate]; // 重复调用会出问题
}
```

### ✅ 正确做法
```objective-c
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 只在真正离开时清理
    if (self.isMovingFromParentViewController || self.isBeingDismissed) {
        [self cleanupSessionIfNeeded];
    }
}

- (void)cleanupSessionIfNeeded {
    if (self.session) {
        [self.session finishTasksAndInvalidate];
        self.session = nil;
    }
}

- (void)dealloc {
    [self cleanupSessionIfNeeded]; // 保险措施
}
```

## 总结

**在 viewWillDisappear 中调用 finishTasksAndInvalidate 的原因：**

1. **避免内存泄漏** - 断开 session 和 delegate 的循环引用
2. **释放网络资源** - 清理网络连接和相关资源
3. **及时清理** - 在页面即将消失时进行清理
4. **优雅退出** - 等待当前任务完成后再清理

**最佳实践：**
- ✅ 在合适的生命周期方法中清理
- ✅ 区分前台和后台 session
- ✅ 添加保险措施防止重复清理
- ✅ 根据场景选择清理方式（finish vs cancel）

这是使用 NSURLSession 时必须要做的资源管理！🔧