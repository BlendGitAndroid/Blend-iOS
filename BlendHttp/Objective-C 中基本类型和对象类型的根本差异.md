这是一个很好的问题！这涉及到 Objective-C 中**基本类型**和**对象类型**的根本差异。让我详细解释：

## 核心原因

### 1. **`int` 是基本类型（值类型）**
```objective-c
@property (nonatomic, assign) int age;  // 基本类型，不能为 nil
```

### 2. **`NSNumber` 是对象类型（指针类型）**
```objective-c
@property (nonatomic, strong) NSNumber *age;  // 对象类型，可以为 nil
```

## 详细分析

### int 类型的问题
```objective-c
// JSON 数据
{
    "name": "李雷",
    "age": null    // JSON 中的 null
}

// 对应的模型
@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;  // 基本类型
@end

// 反序列化时会发生什么？
NSDictionary *json = @{
    @"name": @"李雷",
    @"age": [NSNull null]  // JSON 的 null 会被解析为 NSNull 对象
};

// 尝试赋值
person.age = json[@"age"];  // ❌ 错误！不能将 NSNull 对象赋值给 int
```

### NSNumber 类型正常工作
```objective-c
// 相同的 JSON 数据
{
    "name": "李雷", 
    "age": null
}

// 使用 NSNumber 的模型
@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;  // 对象类型
@end

// 反序列化
NSDictionary *json = @{
    @"name": @"李雷",
    @"age": [NSNull null]
};

// 这样赋值不会报错，但需要处理
person.age = json[@"age"];  // person.age 会是 NSNull 对象，不是 nil！
```

## 类型转换详解

### JSON null 的映射
```objective-c
// JSON 解析后的类型映射
{
    "normalValue": 123,     // -> NSNumber
    "nullValue": null       // -> NSNull （不是 nil！）
}

// 解析结果
NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
NSLog(@"%@", [result[@"nullValue"] class]);  // 输出：NSNull
```

### 为什么会报错
```objective-c
// int 类型只能接受整数值
int value1 = 42;        // ✅ 正确
int value2 = 0;         // ✅ 正确
int value3 = nil;       // ❌ 编译错误：nil 不能赋值给基本类型
int value4 = [NSNull null];  // ❌ 运行时错误：对象不能赋值给基本类型

// NSNumber* 类型可以接受对象指针
NSNumber *num1 = @42;           // ✅ 正确
NSNumber *num2 = nil;           // ✅ 正确
NSNumber *num3 = [NSNull null]; // ⚠️ 技术上可行，但逻辑错误
```

## 正确的处理方式

### 方案1：使用 NSNumber 并做空值检查
```objective-c
@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;  // 使用 NSNumber
@end

// 安全的赋值方式
- (void)updateFromJSON:(NSDictionary *)json {
    self.name = json[@"name"];
    
    id ageValue = json[@"age"];
    if (ageValue == [NSNull null] || ageValue == nil) {
        self.age = nil;  // 明确设置为 nil
    } else {
        self.age = ageValue;
    }
}

// 使用时的安全检查
- (int)getAgeValue {
    return self.age ? [self.age intValue] : 0;  // 提供默认值
}
```

### 方案2：保持 int 类型但做转换
```objective-c
@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;  // 保持基本类型
@end

// 安全的赋值方式
- (void)updateFromJSON:(NSDictionary *)json {
    self.name = json[@"name"];
    
    id ageValue = json[@"age"];
    if (ageValue == [NSNull null] || ageValue == nil) {
        self.age = 0;  // 使用默认值
    } else if ([ageValue isKindOfClass:[NSNumber class]]) {
        self.age = [ageValue intValue];
    } else {
        self.age = 0;  // 其他情况的默认值
    }
}
```

### 方案3：使用 KVC 的安全方式
```objective-c
// KVC 会自动处理一些类型转换，但仍需要处理 NSNull
- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues {
    // 预处理 NSNull 值
    NSMutableDictionary *processedValues = [keyedValues mutableCopy];
    
    [keyedValues enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (obj == [NSNull null]) {
            [processedValues removeObjectForKey:key];  // 移除 NSNull 值
        }
    }];
    
    [super setValuesForKeysWithDictionary:processedValues];
}

// 为 int 属性提供默认值处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // 对于未定义的 key 或 NSNull 值，可以设置默认值
    if ([key isEqualToString:@"age"]) {
        self.age = 0;
    }
}
```

## 实际开发建议

### 1. **API 设计时考虑空值**
```objective-c
// 推荐：使用可选的对象类型
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *email;

// 不推荐：基本类型无法表示"未设置"状态
@property (nonatomic, assign) int age;
```

### 2. **创建安全的 JSON 解析工具**
```objective-c
@implementation JSONHelper

+ (id)safeObjectForKey:(NSString *)key fromDictionary:(NSDictionary *)dict {
    id value = dict[key];
    return (value == [NSNull null]) ? nil : value;
}

+ (int)safeIntForKey:(NSString *)key fromDictionary:(NSDictionary *)dict defaultValue:(int)defaultValue {
    id value = [self safeObjectForKey:key fromDictionary:dict];
    return [value respondsToSelector:@selector(intValue)] ? [value intValue] : defaultValue;
}

@end

// 使用
int age = [JSONHelper safeIntForKey:@"age" fromDictionary:json defaultValue:0];
```

### 3. **使用第三方库**
```objective-c
// JSONModel, Mantle, YYModel 等库会自动处理这些转换
@interface Person : JSONModel
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;  // 库会自动处理 null -> 0 的转换
@end
```

**总结**：
- **int** 是值类型，不能存储 `nil`，当 JSON 中有 `null` 时无法直接赋值
- **NSNumber** 是对象类型，可以为 `nil`，但 JSON 的 `null` 会被解析为 `NSNull` 对象而不是 `nil`
- 正确的做法是在赋值前检查是否为 `NSNull`，并提供适当的默认值或使用对象类型