# 调度组（Dispatch Group）详解

**调度组（Dispatch Group）** 是 GCD 中用于**监控一组任务完成情况**的机制。它允许你将多个任务分组，并等待整个组完成。

## 一、基本概念

### 核心思想：**任务集合 + 完成通知**
```objc
// 创建调度组
dispatch_group_t group = dispatch_group_create();

// 将任务加入组
dispatch_group_async(group, queue, ^{ /* 任务1 */ });
dispatch_group_async(group, queue, ^{ /* 任务2 */ });

// 所有任务完成后执行
dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"所有任务完成");
});
```

## 二、三个核心函数

### 1. **dispatch_group_create()** - 创建组
```objc
dispatch_group_t group = dispatch_group_create();
```

### 2. **dispatch_group_async()** - 异步任务入组
```objc
dispatch_group_async(group, queue, ^{
    // 任务代码
});
```

### 3. **dispatch_group_notify()** - 组完成通知
```objc
// 所有组内任务完成后，在指定队列执行回调
dispatch_group_notify(group, queue, ^{
    NSLog(@"所有任务完成");
});
```

## 三、调度组的两种使用模式

### 模式1：**自动管理（推荐）**
```objc
dispatch_group_t group = dispatch_group_create();
dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

// 添加3个任务到组
for (int i = 0; i < 3; i++) {
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务%d开始", i);
        sleep(arc4random_uniform(3)); // 模拟耗时
        NSLog(@"任务%d完成", i);
    });
}

// 所有任务完成后在主线程执行
dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"🎉 所有任务完成，更新UI");
});
```

### 模式2：**手动管理（更灵活）**
```objc
dispatch_group_t group = dispatch_group_create();

for (int i = 0; i < 3; i++) {
    // 手动进入组
    dispatch_group_enter(group);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务%d开始", i);
        sleep(arc4random_uniform(3));
        NSLog(@"任务%d完成", i);
        
        // 手动离开组
        dispatch_group_leave(group);
    });
}

// 等待组完成（阻塞当前线程）
dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
NSLog(@"所有任务完成");
```

## 四、调度组的实际应用场景

### 场景1：**多图片下载完成后更新UI**
```objc
// 下载多张图片，全部完成后显示
- (void)downloadMultipleImages {
    dispatch_group_t group = dispatch_group_create();
    NSMutableArray *images = [NSMutableArray array];
    
    NSArray *urls = @[@"url1", @"url2", @"url3"];
    
    for (NSString *url in urls) {
        dispatch_group_enter(group);
        
        [self downloadImageWithURL:url completion:^(UIImage *image) {
            if (image) {
                [images addObject:image];
            }
            dispatch_group_leave(group);
        }];
    }
    
    // 所有下载完成后
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"所有图片下载完成，共 %zd 张", images.count);
        [self displayImages:images];
    });
}
```

### 场景2：**并行计算 + 结果合并**
```objc
// 并行计算多个数据，最后合并结果
- (void)calculateStatistics {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    __block NSInteger totalSum = 0;
    __block NSInteger totalCount = 0;
    
    // 并行计算3个数据块
    for (int i = 0; i < 3; i++) {
        dispatch_group_async(group, queue, ^{
            // 模拟计算
            NSInteger sum = [self calculateSumForChunk:i];
            NSInteger count = [self calculateCountForChunk:i];
            
            // 线程安全的累加
            @synchronized(self) {
                totalSum += sum;
                totalCount += count;
            }
        });
    }
    
    // 等待计算完成
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    // 计算平均值
    CGFloat average = totalCount > 0 ? (CGFloat)totalSum / totalCount : 0;
    NSLog(@"计算结果：总和=%zd，数量=%zd，平均值=%.2f", 
          totalSum, totalCount, average);
}
```

### 场景3：**依赖多个网络请求**
```objc
// 多个API请求都完成后刷新页面
- (void)loadAllData {
    dispatch_group_t group = dispatch_group_create();
    
    // 请求1：用户信息
    dispatch_group_enter(group);
    [self loadUserInfoWithCompletion:^{
        dispatch_group_leave(group);
    }];
    
    // 请求2：订单列表
    dispatch_group_enter(group);
    [self loadOrderListWithCompletion:^{
        dispatch_group_leave(group);
    }];
    
    // 请求3：消息列表
    dispatch_group_enter(group);
    [self loadMessagesWithCompletion:^{
        dispatch_group_leave(group);
    }];
    
    // 全部完成后
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog("所有数据加载完成");
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    });
}
```

## 五、调度组的高级用法

### 1. **超时控制**
```objc
dispatch_group_t group = dispatch_group_create();

// 添加任务...
for (int i = 0; i < 3; i++) {
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5); // 模拟长时间任务
        dispatch_group_leave(group);
    });
}

// 最多等待3秒
dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
long result = dispatch_group_wait(group, timeout);

if (result == 0) {
    NSLog(@"✅ 所有任务在3秒内完成");
} else {
    NSLog(@"⏰ 超时！还有任务未完成");
}
```

### 2. **嵌套调度组**
```objc
// 大组包含多个小组
dispatch_group_t parentGroup = dispatch_group_create();
dispatch_group_t childGroup1 = dispatch_group_create();
dispatch_group_t childGroup2 = dispatch_group_create();

// 子组1的任务
dispatch_group_enter(parentGroup);
dispatch_group_async(childGroup1, queue, ^{
    // 任务...
});
dispatch_group_notify(childGroup1, queue, ^{
    NSLog(@"子组1完成");
    dispatch_group_leave(parentGroup);
});

// 子组2的任务
dispatch_group_enter(parentGroup);
dispatch_group_async(childGroup2, queue, ^{
    // 任务...
});
dispatch_group_notify(childGroup2, queue, ^{
    NSLog(@"子组2完成");
    dispatch_group_leave(parentGroup);
});

// 所有子组完成后
dispatch_group_notify(parentGroup, dispatch_get_main_queue(), ^{
    NSLog(@"所有子组完成");
});
```

### 3. **与信号量结合**
```objc
// 控制最大并发数 + 等待所有完成
dispatch_group_t group = dispatch_group_create();
dispatch_semaphore_t semaphore = dispatch_semaphore_create(3); // 最多3个并发

for (int i = 0; i < 10; i++) {
    dispatch_group_enter(group);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 控制并发数
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        NSLog(@"开始任务 %d", i);
        sleep(1);
        NSLog(@"完成任务 %d", i);
        
        dispatch_semaphore_signal(semaphore);
        dispatch_group_leave(group);
    });
}

dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"所有任务完成（最多3个并发）");
});
```

## 六、调度组 vs Barrier

### 区别对比：
| 特性 | 调度组（Dispatch Group） | Barrier |
|------|--------------------------|----------|
| **目的** | 监控一组任务的完成 | 在并发队列中创建检查点 |
| **执行时机** | 所有任务完成后执行回调 | 等前面任务完成→独占执行→继续后面任务 |
| **队列要求** | 任何队列 | 必须是并发队列 |
| **典型场景** | 等待多个异步操作完成 | 读写锁，保护共享资源 |
| **是否阻塞** | notify不阻塞，wait可阻塞 | async不阻塞，sync阻塞 |

### 使用场景对比：
```objc
// 场景1：等待多个任务完成 → 用调度组
dispatch_group_t group = dispatch_group_create();
dispatch_group_async(group, queue, ^{ 下载1 });
dispatch_group_async(group, queue, ^{ 下载2 });
dispatch_group_notify(group, mainQueue, ^{ 更新UI });

// 场景2：保护共享资源 → 用Barrier
dispatch_async(queue, ^{ 读操作 });
dispatch_barrier_async(queue, ^{ 写操作 }); // 独占写入
dispatch_async(queue, ^{ 读操作 });
```

## 七、常见问题与解决方案

### 问题1：**忘记调用 leave**
```objc
// ❌ 错误：enter/leave 不匹配
dispatch_group_enter(group);
// 忘记调用 dispatch_group_leave(group);

// ✅ 正确：使用自动释放
dispatch_group_enter(group);
dispatch_async(queue, ^{
    @try {
        // 任务代码
    } @finally {
        dispatch_group_leave(group); // 确保一定会调用
    }
});
```

### 问题2：**在 notify 中修改共享数据**
```objc
// ❌ 错误：可能有线程安全问题
__block NSMutableArray *results = [NSMutableArray array];

dispatch_group_async(group, queue, ^{
    [results addObject:@"data"]; // 多线程同时修改
});

// ✅ 正确：使用线程安全的方式
dispatch_group_async(group, queue, ^{
    NSString *result = [self calculate];
    
    dispatch_async(safeQueue, ^{
        [results addObject:result]; // 在安全队列中添加
    });
});
```

### 问题3：**嵌套使用死锁**
```objc
// ❌ 错误：可能死锁
dispatch_group_wait(group, DISPATCH_TIME_FOREVER); // 在主线程调用

// 如果组里的任务也需要主线程
dispatch_group_async(group, mainQueue, ^{
    // 主线程任务
});

// ✅ 正确：避免在主线程等待
dispatch_async(globalQueue, ^{
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_async(mainQueue, ^{
        // 更新UI
    });
});
```

## 八、最佳实践总结

### 1. **推荐使用模式**
```objc
- (void)performMultipleTasks {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    
    // 方法1：使用 async 自动管理（简单）
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, queue, ^{
            [self performTask:i];
        });
    }
    
    // 方法2：使用 enter/leave 手动管理（灵活）
    NSArray *urls = @[...];
    for (NSURL *url in urls) {
        dispatch_group_enter(group);
        [self downloadURL:url completion:^{
            dispatch_group_leave(group);
        }];
    }
    
    // 完成回调
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self updateUI];
    });
}
```

### 2. **内存管理**
```objc
// MRC 环境下需要释放
dispatch_group_t group = dispatch_group_create();

// 使用...

#if !__has_feature(objc_arc)
dispatch_release(group); // MRC 需要手动释放
#endif
```

### 3. **调试技巧**
```objc
// 给调度组添加描述（iOS 8+）
if (@available(iOS 8.0, *)) {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_set_specific(group, "com.example.group", "ImageDownload", NULL);
}
```

## 九、实际案例：电商首页加载

```objc
// 电商App首页需要加载多种数据
- (void)loadHomePageData {
    dispatch_group_t group = dispatch_group_create();
    
    // 1. 加载轮播图
    dispatch_group_enter(group);
    [NetworkManager loadBanners:^(NSArray *banners) {
        self.banners = banners;
        dispatch_group_leave(group);
    }];
    
    // 2. 加载推荐商品
    dispatch_group_enter(group);
    [NetworkManager loadRecommendProducts:^(NSArray *products) {
        self.recommendProducts = products;
        dispatch_group_leave(group);
    }];
    
    // 3. 加载限时抢购
    dispatch_group_enter(group);
    [NetworkManager loadFlashSales:^(NSArray *sales) {
        self.flashSales = sales;
        dispatch_group_leave(group);
    }];
    
    // 4. 加载分类
    dispatch_group_enter(group);
    [NetworkManager loadCategories:^(NSArray *categories) {
        self.categories = categories;
        dispatch_group_leave(group);
    }];
    
    // 所有数据加载完成后
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 更新UI
        [self.tableView reloadData];
        
        // 停止加载动画
        [self.refreshControl endRefreshing];
        
        // 显示完成提示
        [self showToast:@"数据加载完成"];
        
        NSLog(@"首页数据加载完成：%zd个轮播图，%zd个推荐商品，%zd个限时抢购，%zd个分类",
              self.banners.count,
              self.recommendProducts.count,
              self.flashSales.count,
              self.categories.count);
    });
    
    // 设置10秒超时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), 
                  dispatch_get_main_queue(), ^{
        // 如果10秒后还没完成，强制停止等待
        [self.refreshControl endRefreshing];
        [self showToast:@"加载超时，请检查网络"];
    });
}
```

## 总结

**调度组的核心价值**：
1. **任务集合管理**：将多个异步任务组织在一起
2. **完成通知**：所有任务完成后执行回调
3. **线程同步**：协调多个并发任务的执行时机
4. **灵活控制**：支持手动 enter/leave，适应各种异步场景

**记住关键点**：
- 使用 `dispatch_group_notify` 不阻塞当前线程
- 使用 `dispatch_group_wait` 可以阻塞等待
- enter 和 leave 必须成对出现
- 调度组本身是线程安全的

调度组是 GCD 中最实用的功能之一，特别适合处理"等待多个异步操作完成"的场景。