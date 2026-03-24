这是一个关于 `NSURLSessionConfiguration` 的详细文档，让我来逐一解释：

## NSURLSessionConfiguration 的作用

**主要功能：**
- 配置网络请求的各种参数和行为
- 是创建 `NSURLSession` 时的配置对象

## 三种配置类型

### 1. **defaultSessionConfiguration**
```objective-c
NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
```
**特点：**
- ✅ **使用磁盘缓存**：会把响应数据缓存到磁盘
- ✅ **存储用户信息**：保存 Cookie、认证信息等
- ✅ **持久化**：APP 重启后缓存和 Cookie 仍然存在

**适用场景：** 大部分正常的网络请求

### 2. **ephemeralSessionConfiguration**
```objective-c
NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
```
**特点：**
- ❌ **无磁盘缓存**：不会把数据写入磁盘
- ❌ **不存储用户信息**：不保存 Cookie
- ❌ **不携带 Cookie**：每次请求都是"干净"的
- ⚡ **速度快**：数据存储在内存中
- 🗑️ **临时性**：需要存储到磁盘需要手动处理

**适用场景：** 隐私浏览、临时请求、不需要缓存的场景

### 3. **backgroundSessionConfigurationWithIdentifier**
```objective-c
NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.myapp.background"];
```
**特点：**
- 🔄 **独立进程**：在单独的进程中下载
- 📱 **APP 进入后台或终止后**：依然可以继续下载
- ⏰ **长时间任务**：适合大文件下载

**适用场景：** 大文件下载、APP 在后台时的网络任务

## 重要属性配置

### **HTTPAdditionalHeaders**
```objective-c
config.HTTPAdditionalHeaders = @{
    @"Authorization": [self getAuthorizationStr],
    @"User-Agent": @"MyApp/1.0",
    @"Accept": @"application/json"
};
```
**作用：** 为所有请求添加通用的 HTTP 头

### **requestCachePolicy**
```objective-c
config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData; // 忽略缓存
config.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;        // 使用协议缓存策略
```

### **timeoutIntervalForRequest**
```objective-c
config.timeoutIntervalForRequest = 30.0; // 30秒超时
```

### **allowsCellularAccess**
```objective-c
config.allowsCellularAccess = NO; // 禁止使用蜂窝网络
```

### **HTTPMaximumConnectionsPerHost**
```objective-c
config.HTTPMaximumConnectionsPerHost = 4; // 每个主机最大连接数
```

## 实际使用示例

```objective-c
// 创建配置
NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];

// 设置通用请求头
config.HTTPAdditionalHeaders = @{
    @"Authorization": [self getAuthorizationStr],
    @"Content-Type": @"application/json"
};

// 设置超时时间
config.timeoutIntervalForRequest = 15.0;

// 设置缓存策略
config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

// 创建 session
NSURLSession *session = [NSURLSession sessionWithConfiguration:config 
                                                      delegate:self 
                                                 delegateQueue:[NSOperationQueue mainQueue]];
```

## 文档中的演示代码解析

```objective-c
NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
config.HTTPAdditionalHeaders = @{@"Authorization": [self getAuthorizationStr]};
```

这段代码：
1. 创建了默认配置
2. 为所有请求添加了 `Authorization` 头
3. `[self getAuthorizationStr]` 是获取授权令牌的方法

这样配置后，通过这个 session 发出的所有请求都会自动携带 Authorization 头，非常适合需要身份验证的 API 请求。