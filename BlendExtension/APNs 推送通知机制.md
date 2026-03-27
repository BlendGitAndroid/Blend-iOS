## APNs 推送通知机制完整总结

---

### 一、什么是 APNs

**APNs（Apple Push Notification service）** 是苹果的推送通知服务器，是所有 iOS 远程推送的"中转站"。

> 为什么需要 APNs？因为 App 在后台或关闭状态下，公司服务器无法直接连接到用户手机，必须通过苹果的 APNs 中转。

---

### 二、完整推送流程（结合图1）

图中用 QQ 举例，张三（QQ:12345）的手机接收李四发来的消息：

#### 注册阶段（步骤 1-4，App 启动时）

```
①  手机 → APNs
   发送：UDID（设备唯一标识）+ Bundle Identifier（App 包名）

②  APNs → 手机
   返回：deviceToken = 888
   （deviceToken = 苹果用私钥加密生成的唯一令牌，代表"这台手机上的这个App"）

③  手机 → QQ服务器
   发送：deviceToken(888) + 用户标识(QQ:12345)

④  QQ服务器 → 数据库
   存储：{ id:1, name:张三, qq:12345, deviceToken:888 }
```

#### 推送阶段（步骤 5-8，有人发消息时）

```
⑤  李四的手机 → QQ服务器
   李四发消息给张三（QQ:12345）：吃饭没？

⑥  QQ服务器 → 数据库
   查询张三的 deviceToken
   结果：deviceToken = 888

⑦  QQ服务器 → APNs
   告知：{ deviceToken:888, body:"李四:吃饭没？" }

⑧  APNs → 张三的手机
   通过 deviceToken:888 找到张三的设备
   推送通知到张三手机
```

完整流程图：

```
李四发消息
    ↓
QQ服务器 ──查询deviceToken──→ 数据库
    ↓ 拿到 token=888
    ↓
APNs服务器 ──→ 张三的手机（token=888）弹出通知
```

---

### 三、deviceToken 是什么

- **唯一性**：每台设备 + 每个 App = 一个唯一的 deviceToken
- **由苹果生成**：开发者无法自己生成，必须向 APNs 申请
- **会变化**：重装 App、系统升级、还原设备后可能变化，所以每次启动 App 都要重新获取并上传给服务器

```
deviceToken = 设备的"门牌号"
APNs        = 快递公司
推送消息     = 快递包裹

只要知道门牌号，快递公司就能送达
```

---

### 四、iOS 端需要做的事（图2）

```objc
// 1. 请求苹果获取 deviceToken（需要用户授权）
[[UIApplication sharedApplication] registerForRemoteNotifications];

// 2. 得到苹果返回的 deviceToken（回调）
- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [deviceToken description];
    // 3. 发送 deviceToken 给公司服务器
    [MyServer uploadDeviceToken:token];
}

// 4. 监听用户对通知的点击
- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // 处理通知内容，跳转对应页面
}
```

---

### 五、证书体系

推送需要证书来保证安全性（防止任意服务器随意推送）：

#### 调试阶段（开发时）

| 证书 | 作用 |
|------|------|
| `aps_development.cer` | 让某台 Mac 能调试某个 App 的推送服务 |
| `ios_development.cer` | 让 Mac 具备真机调试的能力 |
| `iphone5_qq.mobileprovision` | 让某台 Mac 利用某台设备调试某个程序 |

#### 发布阶段（上线时）

| 证书 | 作用 |
|------|------|
| `aps_production.cer` | App 含推送服务时必须安装，用于生产环境推送 |
| `ios_distribution.cer` | 让 Mac 具备发布程序的能力 |
| `qq.mobileprovision` | 让某台 Mac 能发布某个程序 |

> 证书本质是为了让 APNs 信任你的服务器，只有持有苹果颁发的证书的服务器才能向 APNs 发送推送请求。

---

### 六、重要注意事项

| 注意点 | 说明 |
|--------|------|
| 必须真机 | 模拟器没有 deviceToken，无法测试远程推送 |
| 需要用户授权 | iOS 8+ 必须弹窗请求用户同意才能推送 |
| deviceToken 要及时更新 | 每次启动都上传最新 token，防止 token 变化推送失败 |
| 区分开发/生产证书 | 开发证书推送的通知只能发到开发包，上线要换生产证书 |
| APNs 不保证送达 | 设备离线时 APNs 会缓存最新一条，在线后补发，但不保证 100% 送达 |

---

### 七、现代写法（iOS 10+）

上面的流程不变，但 iOS 端的代码要改用新框架：

```objc
// 请求权限（新）
UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
[center requestAuthorizationWithOptions:
    UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge
    completionHandler:^(BOOL granted, NSError *error) {
        if (granted) {
            // 权限获得，再注册远程通知
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
    }];
```

**流程不变，API 变了** — APNs 的整套机制（token → 服务器 → APNs → 设备）到今天依然是这样运作的。