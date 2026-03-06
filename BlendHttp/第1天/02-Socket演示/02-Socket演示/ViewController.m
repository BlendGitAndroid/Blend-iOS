//
//  ViewController.m
//  02-Socket演示
//
//  Created by Apple on 15/10/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import <arpa/inet.h>
#import <netinet/in.h>
#import <sys/socket.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1 创建Socket

    // 第一个参数 domain 协议簇  指定IPv4
    // 第二个参数 type   socket的类型  流socket  数据报socket
    // 第三个参数 protocol  协议

    // 返回值 如果创建成功返回的是socket的描述符，失败-1
    int clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    // 2 连接服务器
    // 第一个参数 socket的描述符
    // 第二个参数 结构体 ip地址和端口
    // 第三个参数 结构体的长度 sizeof
    // 返回值 成功0  失败非0
    //    addr.sin_family = AF_INET;
    //    addr.sin_port=htons(PORT);
    //    addr.sin_addr.s_addr = inet_addr(SERVER_IP);
    struct sockaddr_in addr;
    addr.sin_family = AF_INET; // 协议簇  指定IPv4
    addr.sin_addr.s_addr = inet_addr(
        "127.0.0.1"); // inet_addr 把点分十进制的ip地址转换成网络字节序的整数
    addr.sin_port = htons(
        12345); // htons host to network short  把主机字节序转换成网络字节序

    int result =
        connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    //    if (result == 0) {
    //        NSLog(@"成功");
    //    }else{
    //        NSLog(@"失败");
    //    }

    if (result != 0) {
        NSLog(@"失败");
        return;
    }

    // 3 向服务器发送数据
    // 成功则返回实际传送出去的字符数，失败返回－1
    const char *msg = "hello world";
    // send函数的四个参数的意思是：
    // 1. socket描述符
    // 2. 发送数据的缓冲区
    // 3. 发送数据的长度
    // 4. 发送选项，通常为0
    ssize_t sendCount = send(clientSocket, msg, strlen(msg), 0);
    NSLog(@"发送的字节数 %zd", sendCount);

    // 4 接收服务器返回的数据
    // 返回的是实际接收的字节个数
    uint8_t buffer[1024];
    ssize_t recvCount = recv(clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收的字节数 %zd", recvCount);

    // 把字节数组转换成字符串
    NSData *data = [NSData dataWithBytes:buffer length:recvCount];
    NSString *recvMsg = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"shoudao : %@", recvMsg);

    // 5 关闭连接
    close(clientSocket);
}

@end
