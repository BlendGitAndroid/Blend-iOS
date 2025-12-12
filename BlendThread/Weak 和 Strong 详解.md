# Weak 和 Strong 详解

## 📖 你的图片文字翻译

```
控制器 ==> 视图 ==> 子视图数组 ==> UIImageView（强引用）
控制器 --> UIImageView（弱引用）

控制器 --> UIImageView 这个位置换成 strong 也可以，但是不建议，
因为如果一个对象被多个对象强引用，这多个对象中有一个对象忘记释放，
那么该对象也不能释放。
```

## 🎯 核心概念解释

### 1. **Strong（强引用）**
```objective-c
@property (nonatomic, strong) NSObject *obj;
```
- **作用**：创建**所有权关系**，引用计数 +1
- **效果**：只要 strong 引用存在，对象就不会被释放
- **类比**：像你**拥有**一本书，只要你不还（释放），书就一直在

### 2. **Weak（弱引用）**
```objective-c
@property (nonatomic, weak) NSObject *obj;
```
- **作用**：创建**观察关系**，引用计数 **不增加**
- **效果**：对象释放后，weak 引用**自动变为 nil**
- **类比**：像你**借阅**一本书，图书馆（系统）收回书时，你知道书没了

## 🖼️ UIView 控件的内存关系图

```
    ┌─────────────────────────────────────────────┐
    │          ViewController                     │
    │                                             │
    │  self.view ──strong──► UIView              │
    │      │                                    │
    │      │                                    │
    │      ▼                                    │
    │  view.subviews ──strong──► [subview1,     │
    │                             subview2, ...] │
    │                                │          │
    │                                ▼          │
    │                           UIImageView     │
    │      │                              │     │
    │      │                              │     │
    │      └─────weak─────────────────────┘     │
    │        self.imageView（IBOutlet）         │
    └─────────────────────────────────────────────┘
```

## 🔍 为什么 UI 控件用 weak？

### 实际内存关系分析：

```objective-c
// Storyboard/XIB 中的连线
@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;

// 实际上发生了三件事：
// 1. Storyboard 创建了 UIImageView 对象
// 2. UIImageView 被添加到 self.view.subviews 数组中（强引用）
// 3. self.avatarImageView 只是指向这个 UIImageView（弱引用）

// 内存关系：
// self.view.subviews ──strong──► UIImageView
// self.avatarImageView ──weak──► UIImageView
```

### 如果改成 strong 会怎样？

```objective-c
@property (nonatomic, strong) IBOutlet UIImageView *avatarImageView;

// 内存关系变成：
// 1. self.view.subviews ──strong──► UIImageView
// 2. self.avatarImageView ──strong──► UIImageView

// 问题：两个强引用！
// 当控制器销毁时：
// - self.avatarImageView 释放，引用计数 -1
// - UIImageView 还在 self.view.subviews 中（引用计数仍为 1）
// - UIImageView 无法释放，内存泄漏！
```

## 💻 代码示例对比

### 示例1：正确的 weak 用法
```objective-c
// ViewController.h
@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;  // ✅ 正确
@end

// 生命周期：
// 1. ViewController 加载时，Storyboard 创建 UILabel
// 2. UILabel 被添加到 self.view（强引用）
// 3. self.titleLabel 弱引用指向它
// 4. ViewController 销毁时：
//    - self.view 释放 → UILabel 释放
//    - self.titleLabel 自动变为 nil
// ✅ 没有内存泄漏
```

### 示例2：错误的 strong 用法
```objective-c
// ViewController.h
@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;  // ❌ 危险
@end

// 生命周期：
// 1. ViewController 加载时，Storyboard 创建 UILabel
// 2. UILabel 被添加到 self.view（强引用1）
// 3. self.titleLabel 也强引用它（强引用2）
// 4. ViewController 销毁时：
//    - self.view 释放 → 强引用1消失
//    - 但 UILabel 还被 self.titleLabel 强引用！
// ❌ UILabel 无法释放，内存泄漏！
```

### 示例3：手动创建的控件应该用 strong
```objective-c
// 手动创建的控件需要用 strong
@interface ViewController : UIViewController
// Storyboard 连线的控件
@property (nonatomic, weak) IBOutlet UIButton *storyboardButton;

// 手动创建的控件
@property (nonatomic, strong) UIButton *customButton;  // ✅ 需要 strong
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 手动创建按钮
    self.customButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.customButton];
    // 现在有：
    // 1. self.customButton ──strong──► UIButton
    // 2. self.view.subviews ──strong──► UIButton
}
@end
```

## 🎯 使用规则总结

### 什么时候用 Strong？
```objective-c
// 1. 手动创建的对象（所有权）
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) CustomModel *model;

// 2. 不是从 Storyboard/XIB 连线的视图
@property (nonatomic, strong) UILabel *customLabel;
@property (nonatomic, strong) UIButton *actionButton;

// 3. 需要长期持有的对象
@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic, strong) CLLocationManager *locationManager;
```

### 什么时候用 Weak？
```objective-c
// 1. Storyboard/XIB 的 IBOutlet（系统已强引用）
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;

// 2. 委托（避免循环引用）
@property (nonatomic, weak) id<UITableViewDelegate> delegate;

// 3. 父子视图的引用
@property (nonatomic, weak) UIView *parentView;
@property (nonatomic, weak) UIViewController *presentingController;

// 4. 避免循环引用的对象引用
@property (nonatomic, weak) SomeManager *manager;  // 如果 manager 也强引用 self
```

## 🔧 实际开发中的决策流程

```
需要声明一个属性
    ↓
问：这个对象是否已经由其他对象强引用？
    ├── 是（如：Storyboard控件、父视图的子视图）
    │       → 用 weak（避免重复强引用）
    │
    └── 否（如：手动创建的数据对象、工具类实例）
            → 用 strong（建立所有权）
```

## ⚠️ 常见错误和陷阱

### 错误1：该用 strong 时用了 weak
```objective-c
// 手动创建控件却用 weak
@property (nonatomic, weak) UILabel *customLabel;  // ❌ 错误！

- (void)viewDidLoad {
    UILabel *label = [[UILabel alloc] init];  // 局部变量
    self.customLabel = label;  // weak 引用，不增加计数
    [self.view addSubview:label];
    
    // 问题：label 是局部变量，方法结束后可能被释放！
    // 即使添加到 view 中，也可能被提前释放
}
```

### 错误2：该用 weak 时用了 strong
```objective-c
// Storyboard 连线用 strong
@property (nonatomic, strong) IBOutlet UIView *contentView;  // ❌ 可能导致内存泄漏

// 委托用 strong
@property (nonatomic, strong) id<DataSourceDelegate> delegate;  // ❌ 循环引用风险
```

### 错误3：混淆 weak 和 assign
```objective-c
// 对于 UI 控件，应该用 weak，不是 assign
@property (nonatomic, assign) IBOutlet UIImageView *imageView;  // ❌ 危险！

// assign 不会自动置 nil，控件释放后访问会崩溃
// weak 会安全地变为 nil
```

## 🎓 测试你的理解

```objective-c
// 问题：下面哪些属性声明是正确的？

// 1.
@property (nonatomic, weak) NSMutableArray *array;  // ❌ 数组应该用 strong

// 2.
@property (nonatomic, strong) IBOutlet UILabel *label;  // ❌ Storyboard 控件应用 weak

// 3.
@property (nonatomic, weak) id<NetworkDelegate> delegate;  // ✅ 正确

// 4.
@property (nonatomic, strong) UIView *customView;  // ✅ 手动创建的视图

// 5.
@property (nonatomic, assign) UIButton *button;  // ❌ 应该用 weak
```

## 💡 快速记忆法则

```
UI控件分两种，Storyboard连弱手动强
数据模型工具类，统统都要用strong
委托代理循环防，一定记得用weak上
基本类型没得选，assign才是正确项
```

## 🔄 现代开发的变化

### Swift 中的对应概念：
```swift
// Swift 中更简单：
@IBOutlet weak var titleLabel: UILabel!  // weak
var dataArray: [String] = []            // 默认是 strong
weak var delegate: SomeDelegate?        // weak
```

### 对于 iOS 开发者的实际建议：

1. **Storyboard/XIB 连线**：总是用 **weak**
2. **手动代码创建**：总是用 **strong**
3. **委托属性**：总是用 **weak**
4. **基本数据类型**：用 **assign**
5. **不确定时**：问自己"谁负责释放这个对象？"

**记住**：Objective-C 的 ARC 已经很智能，但错误的 strong/weak 使用仍会导致内存泄漏或崩溃。理解引用关系是关键！