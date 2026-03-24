这是 KVO 机制的一个重要知识点。让我详细解释你是怎么知道要实现 `observeValueForKeyPath` 方法的：

## 1. **这是 KVO 的固定协议**

### **NSKeyValueObserving 协议**
```objective-c
// NSObject 已经实现了这个协议
@protocol NSKeyValueObserving
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context;
@end
```

**重要：** 这个方法名是**苹果规定死的**，不能改名！

## 2. **文档和约定**

### **苹果官方文档明确说明：**
```
当你调用 addObserver:forKeyPath:options:context: 时，
系统会在属性变化时自动调用观察者的 observeValueForKeyPath:ofObject:change:context: 方法
```

### **这是固定的回调约定**
```objective-c
// 第1步：添加观察者
[someObject addObserver:self forKeyPath:@"property" options:0 context:nil];

// 第2步：系统自动调用这个固定名称的方法
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    // 你的处理代码
}
```

## 3. **类似其他系统协议的模式**

### **委托模式的例子**
```objective-c
// UITableView 的委托方法名是固定的
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

// NSURLConnection 的委托方法名是固定的  
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
```

### **KVO 也是同样的模式**
```objective-c
// KVO 的回调方法名是固定的
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;
```

## 4. **怎么知道方法签名？**

### **方法1：查看文档**
在 Xcode 中：
```
Help → Developer Documentation → 搜索 "Key-Value Observing"
```

### **方法2：自动补全**
```objective-c
@implementation MyClass

// 在 Xcode 中输入 "observe" 然后按 Tab，会自动补全
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    <#code#>
}

@end
```

### **方法3：编译器警告**
如果你不实现这个方法：
```objective-c
[progress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:nil];
// 编译器警告：Method '-observeValueForKeyPath:ofObject:change:context:' not found
```

## 5. **为什么是这个方法名？**

### **方法名的组成部分：**
```objective-c
observeValueForKeyPath: // "观察键路径的值"
              ofObject: // "属于对象"  
                change: // "变化信息"
               context: // "上下文"
```

### **参数的含义：**
```objective-c
- (void)observeValueForKeyPath:(NSString *)keyPath     // 哪个属性变了
                      ofObject:(id)object              // 哪个对象的属性
                        change:(NSDictionary *)change  // 怎么变的（新值、旧值）
                       context:(void *)context {       // 你设置的上下文信息
    
    // 根据 keyPath 判断是哪个属性
    if ([keyPath isEqualToString:@"fractionCompleted"]) {
        NSProgress *progress = (NSProgress *)object;
        NSLog(@"进度变化: %f", progress.fractionCompleted);
    }
}
```

## 6. **实际学习过程**

### **新手的学习路径：**
```objective-c
// 第1次：看到示例代码，不知道为什么
[progress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:nil];

// 第2次：发现需要实现一个方法，但不知道方法名
// 编译器报错或者运行时没反应

// 第3次：查文档或教程，知道要实现 observeValueForKeyPath
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    // 现在知道了！
}
```

### **记忆技巧：**
```
addObserver → 需要实现回调方法
forKeyPath  → observeValueForKeyPath
```

## 7. **完整的对应关系**

```objective-c
// 添加观察者时的参数
[target addObserver:self                    // 观察者
         forKeyPath:@"propertyName"         // 要观察的属性路径
            options:NSKeyValueObservingOptionNew  // 选项
            context:someContext];           // 上下文

// 回调方法接收的参数
- (void)observeValueForKeyPath:(NSString *)keyPath  // 对应 forKeyPath
                      ofObject:(id)object           // 对应 target
                        change:(NSDictionary *)change // 根据 options 生成
                       context:(void *)context {     // 对应 context
}
```

## 总结

**你怎么知道要用 `observeValueForKeyPath`？**

1. ✅ **这是苹果定义的固定协议**，不能改名
2. ✅ **查看官方文档**会明确说明
3. ✅ **Xcode 自动补全**会提示你
4. ✅ **编译器警告**会提醒你实现这个方法
5. ✅ **这是 KVO 的标准模式**，就像委托方法一样

**记住：**
> KVO 就像其他苹果 API 一样，有固定的方法名约定。一旦你使用了 `addObserver`，就必须实现对应的 `observeValueForKeyPath` 方法。

这就是为什么学习 iOS 开发需要多看文档和示例代码的原因！