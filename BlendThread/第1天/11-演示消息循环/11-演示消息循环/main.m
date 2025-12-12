//
//  main.m
//  11-演示消息循环
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

void handle(int n) {
    if (n == 1) {
        printf("点击了按钮\r\n");
    } else if (n == 2) {
        printf("拖动scrollView\r\n");
    }
}

int main(int argc, const char *argv[]) {
    // 消息循环的作用  让程序不退出
    //               处理事件

    // 模拟消息循环，可以简单理解成一个死循环
    while (YES) {
        printf("请输入操作：");

        int number;
        scanf("%d", &number);

        if (number == 0) {
            // 程序退出
            break;
        } else {
            // 处理事件
            handle(number);
        }
    }

    return 0;
}
