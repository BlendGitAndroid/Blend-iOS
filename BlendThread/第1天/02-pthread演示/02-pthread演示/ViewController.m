//
//  ViewController.m
//  02-pthread演示
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import <pthread/pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //学习新函数或方法的三要素
    //1 函数的功能
    //2 函数的参数
    //3 函数的返回值
    
    
    //第一个参数 线程编号的地址
    //第二个参数 线程的属性
    //第三个参数 线程要执行的函数void *    (*)    (void *)
    // int * 指向int类型的指针   void * 指向任何类型的指针  有点类似OC中的id
    //第四个参数 要执行的函数的参数
    
    //函数的返回值  int    0是成功  非0 是失败
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建子线程
    pthread_t pthread; //线程编号
    
    
    int result =  pthread_create(&pthread, NULL, demo, NULL);
    
    // 主线程的线程编号是1
    NSLog(@"touchesBegan  %@",[NSThread currentThread]);
    
    if (result == 0) {
        NSLog(@"成功");
    }else {
        NSLog(@"失败");
    }
}

void *demo(void *param) {
    NSLog(@"hello %@",[NSThread currentThread]);
    return NULL;
}


@end
