//
//  UIImageView+MyView.m
//  06-关联对象
//
//  Created by Apple on 15/10/17.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "UIImageView+MyView.h"
#import <objc/runtime.h>

// 1 可以在运行期间给某个对象增加属性
// 2 可以在运行期间获取某个对象的所有属性名称
// 3 交换方法

// 联合对象
// objc_setAssociatedObject 是 Objective-C 运行时提供的函数，用于给对象动态添加关联属性。
@implementation UIImageView (MyView)

- (NSString *)urlString {
    // 从关联对象中获取属性值
    return objc_getAssociatedObject(self, "str");
}

- (void)setUrlString:(NSString *)urlString {
    // 可以在运行期间给某个对象增加属性
    // 关联对象
    // 1. id object
    // - 含义 ：要关联的源对象，即你想给哪个对象添加关联属性
    // - 示例 ：通常是 self ，表示给当前对象添加关联属性 2. const void *key
    // - 含义 ：关联的唯一标识符，用于后续通过 objc_getAssociatedObject
    // 检索关联对象
    // - 特点 ：
    //   - 必须是全局唯一的
    //   - 常用做法：使用静态变量作为 key
    //   - 也可以使用 @selector 作为 key（因为 selector 在运行时是唯一的） 3. id
    //   value
    // - 含义 ：要关联的目标对象，即你想附加到源对象上的数据
    // - 类型 ：可以是任何 Objective-C 对象 4. objc_AssociationPolicy policy
    // - 含义 ：关联策略，决定了关联对象的内存管理方式
    // - 常用策略 ：
    //   - OBJC_ASSOCIATION_ASSIGN ：弱引用，不增加引用计数
    //   - OBJC_ASSOCIATION_RETAIN_NONATOMIC ：强引用，非原子操作
    //   - OBJC_ASSOCIATION_COPY_NONATOMIC ：复制，非原子操作
    //   - OBJC_ASSOCIATION_RETAIN ：强引用，原子操作
    //   - OBJC_ASSOCIATION_COPY ：复制，原子操作
    objc_setAssociatedObject(self, "str", urlString,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
