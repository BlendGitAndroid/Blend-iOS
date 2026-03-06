//
//  ViewController.m
//  04-socket请求百度
//
//  Created by Apple on 15/10/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import <arpa/inet.h>
#import <netinet/in.h>
#import <sys/socket.h>
@interface ViewController ()
@property(weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic, assign) int clientSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1 连接百度的服务器
    BOOL result = [self connect:@"61.135.169.125" port:80];
    if (!result) {
        NSLog(@"连接失败");
        return;
    }
    NSLog(@"连接成功");

    // 构造http请求头
    NSString *request = @"GET / HTTP/1.1\r\n"
                         "Host: www.baidu.com\r\n"
                         "User-Agent: Mozilla/5.0 (Linux; Android 4.0.3; HTC "
                         "One X Build/IML74K) AppleWebKit/535.19 (KHTML, like "
                         "Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19\r\n"
                         "Connection: keep-alive\r\n\r\n";

    // http/1.0  短连接  当响应结束后连接会立即断开
    // http/1.1  长连接
    // 当响应结束后，连接会等待非常短的时间，如果这个时间内没有新的请求，就断开连接

    // 服务器返回的响应头 和 响应体
    NSString *respose = [self sendAndRecv:request];
    NSLog(@"----%@", respose);

    // 关闭连接  http协议要求，请求结束后要关闭连接
    close(self.clientSocket);

    // 截取响应头   响应头结束的表示\r\n\r\n<!

    // 找到\r\n\r\n 的范围
    NSRange range = [respose rangeOfString:@"\r\n\r\n"];
    // 从\r\n\r\n之后的第一个位置开始截取字符串  响应体
    NSString *html = [respose substringFromIndex:range.length + range.location];

    // 把响应体显示在webView上
    // baseURL: 解析html中的相对路径时会用到
    // 
    [self.webView loadHTMLString:html
                         baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}

// 1 连接服务器
- (BOOL)connect:(NSString *)ip port:(int)port {
    int clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    self.clientSocket = clientSocket;

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr(ip.UTF8String);
    addr.sin_port = htons(port);

    int result =
        connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if (result == 0) {
        return YES;
    } else {
        return NO;
    }
}

// 2 发送和接收数据
- (NSString *)sendAndRecv:(NSString *)sendMsg {
    // 3 向服务器发送数据
    // 成功则返回实际传送出去的字符数，失败返回－1
    const char *msg = sendMsg.UTF8String;
    ssize_t sendCount = send(self.clientSocket, msg, strlen(msg), 0);
    NSLog(@"发送的字节数 %zd", sendCount);

    // 4 接收服务器返回的数据
    // 返回的是实际接收的字节个数
    uint8_t buffer[1024];

    NSMutableData *mData = [NSMutableData data];

    ssize_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    
    [mData appendBytes:buffer length:recvCount];

    // 服务器会返回多次数据，等所有的数据都接收完成，再转换成字符串
    while (recvCount != 0) {
        recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
        NSLog(@"接收的字节数 %zd", recvCount);
        [mData appendBytes:buffer length:recvCount];
    }

    // 把字节数组转换成字符串
    NSString *recvMsg = [[NSString alloc] initWithData:mData.copy
                                              encoding:NSUTF8StringEncoding];
    return recvMsg;
}

@end
