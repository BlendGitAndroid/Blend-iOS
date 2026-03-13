//
//  ViewController.m
//  04-解决数组输出汉字的问题
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 输出的是Unicode 转义序列！这是因为控制台显示中文时的编码问题。
    NSArray *names = @[ @"李雷", @"韩梅梅", @"马户" ];
    NSLog(@"%@", names);
    //    (
    // "\U674e\U96f7",
    // "\U97e9\U6885\U6885",
    // "\U9a6c\U6237"
    // )

    NSString *name = @"李雷";
    NSLog(@"%@", name);

    // 关键区别：description 方法的实现不同
    // NSString 的 description 方法直接返回字符串本身
    // 等价于：NSLog(@"%@", [name description]);
    // [name description] 返回 @"李雷"

    // NSArray 的 description 方法会：
    // 1. 创建一个格式化的字符串表示
    // 2. 为了确保输出的"安全性"和"可读性"，对非ASCII字符使用Unicode转义
    // 3. 返回类似 "(\n    \"\\U674e\\U96f7\",\n    ...)" 的字符串

    HMPerson *person1 = [[HMPerson alloc] init];
    person1.name = @"马户";
    person1.age = 18;

    NSLog(@"%@", person1);
}

@end
