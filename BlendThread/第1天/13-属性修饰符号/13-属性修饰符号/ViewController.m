//
//  ViewController.m
//  13-属性修饰符号
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

// 属性修饰符
//  retain  mrc中使用
//  strong arc中使用
//  weak   只有arc下才能用weak
//  assign arc和mrc都可以使用
//  copy   arc和mrc都可以使用
// 1 字符串为什么用copy
// 2 block作为属性的时候 为什么要用copy
// 3 delegate为什么用weak修饰
// 4 weak和assign的区别

// 定义block
@property(nonatomic, copy) void (^myBlock)();
@property(nonatomic, copy) NSString *name;

@property(nonatomic, weak) Person *weakPerson;
@property(nonatomic, assign) Person *assignPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1 字符串为什么用copy
    //    NSMutableString *str = [NSMutableString string];
    //    [str appendString:@"hello"];
    //    self.name = [str copy];
    //
    //    [str appendString:@"zs"];
    //
    //    NSLog(@"%@",self.name);
    // 如果改为strong修饰，那么name的值就会被赋予str的地址，当str改变时，name的值也会改变，所以用copy修饰，保证name的值不变

    // 2 block 为什么要用copy

    // 第一种 block   全局block，存储在代码区  __NSGlobalBlock__
    //    void (^demo)() = ^{
    //        NSLog(@"aaa");
    //    };
    //    NSLog(@"%@",demo);  // 打印的是方法签名

    // 第二种block   栈Block，存储在栈区  __NSStackBlock__
    //    int number = 5;
    //    void (^demo)() = ^{
    //        NSLog(@"aaa %d",number); // block内访问外部的变量
    //    };
    //    NSLog(@"%@",demo);

    // 第三种block   堆block  __NSMallocBlock__
    //    int number = 5;
    //    void (^demo)() = ^{
    //        NSLog(@"aaa %d",number);
    //    };
    //    NSLog(@"%@",[demo copy]); // 增加了copy操作，存储在堆区

    //    [self test];
    //
    //    self.myBlock();
    //    self.myBlock(); // 不用copy，这里会变成僵尸对象，原因是block被释放了

    // 3 delegate为什么用weak修饰
    //    self.person = [Person new];
    //    self.person.delegate = self;
    //
    // vc-->person-->delegate-->self(vc)
    // 这里就有循环引用，所以得断开这个循环引用

    // 4 weak和assign的区别（两者都没有强引用修饰）
    // 一个对象用weak修饰
    self.weakPerson = [Person new];
    // 只有一个弱引用修饰，因此Person内存被释放了，而weakPerson被指向0地址，所以赋值还是为null
    self.weakPerson.name = @"zs";
    NSLog(@"weakPerson  %@", self.weakPerson.name);

    // 一个对象用assign修饰
    self.assignPerson = [Person new];
    // assignPerson的对象也被释放了，因为没有强引用，但是assignPerson还是指向被释放的内存，造成野指针问题
    self.assignPerson.name = @"ls";
    NSLog(@"assignPerson  %@", self.assignPerson.name);
}

// 给block属性赋值
- (void)test {
    int n = 5;
    [self setMyBlock:^{
      NSLog(@"%d", n);
    }];

    NSLog(@"%@", self.myBlock);
}

@end
