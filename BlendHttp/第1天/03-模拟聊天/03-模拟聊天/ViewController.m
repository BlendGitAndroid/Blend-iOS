//
//  ViewController.m
//  03-模拟聊天
//
//  Created by Apple on 15/10/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import <arpa/inet.h>
#import <netinet/in.h>
#import <sys/socket.h>

@interface ViewController ()
// 原有的IBOutlet保持不变，但添加新的属性
@property(weak, nonatomic) IBOutlet UITextField *ipView;
@property(weak, nonatomic) IBOutlet UITextField *portView;
@property(weak, nonatomic) IBOutlet UITextField *sendMsgView;
@property(weak, nonatomic) IBOutlet UILabel *recvMsgView;

// 新增属性来改善UI体验
@property (nonatomic, strong) UITextView *enhancedRecvView;
@property (nonatomic, strong) NSMutableString *chatHistory;
@property (nonatomic, assign) BOOL isConnected;

@property(nonatomic, assign) int clientSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEnhancedUI];
    self.chatHistory = [[NSMutableString alloc] init];
    self.isConnected = NO;
}

- (void)setupEnhancedUI {
    // 隐藏原来的Label，用TextView替代
    self.recvMsgView.hidden = YES;
    
    // 创建增强的消息显示区域
    self.enhancedRecvView = [[UITextView alloc] init];
    self.enhancedRecvView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.97 alpha:1.0];
    self.enhancedRecvView.layer.cornerRadius = 8.0;
    self.enhancedRecvView.layer.borderWidth = 1.0;
    self.enhancedRecvView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.enhancedRecvView.font = [UIFont systemFontOfSize:14];
    self.enhancedRecvView.editable = NO;
    self.enhancedRecvView.text = @"📱 聊天记录将在这里显示...\n";
    self.enhancedRecvView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.enhancedRecvView];
    
    // 设置约束 - 在原Label下方显示
    [NSLayoutConstraint activateConstraints:@[
        [self.enhancedRecvView.topAnchor constraintEqualToAnchor:self.recvMsgView.bottomAnchor constant:10],
        [self.enhancedRecvView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.enhancedRecvView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.enhancedRecvView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20]
    ]];
    
    // 美化输入框
    self.ipView.layer.cornerRadius = 6.0;
    self.ipView.layer.borderWidth = 1.0;
    self.ipView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.portView.layer.cornerRadius = 6.0;
    self.portView.layer.borderWidth = 1.0;
    self.portView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.sendMsgView.layer.cornerRadius = 6.0;
    self.sendMsgView.layer.borderWidth = 1.0;
    self.sendMsgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)appendToChatHistory:(NSString *)message {
    NSString *timestamp = [NSDateFormatter localizedStringFromDate:[NSDate date] 
                                                         dateStyle:NSDateFormatterNoStyle 
                                                         timeStyle:NSDateFormatterMediumStyle];
    NSString *formattedMessage = [NSString stringWithFormat:@"[%@] %@\n", timestamp, message];
    
    [self.chatHistory appendString:formattedMessage];
    self.enhancedRecvView.text = self.chatHistory;
    
    // 滚动到底部
    [self.enhancedRecvView scrollRangeToVisible:NSMakeRange(self.enhancedRecvView.text.length, 0)];
}

// 点击连接按钮
- (IBAction)connectClick:(id)sender {
    UIButton *connectBtn = (UIButton *)sender;
    
    if (self.isConnected) {
        // 如果已连接，则断开
        [self closeClick:sender];
        return;
    }
    
    // 连接服务器
    BOOL success = [self connect:self.ipView.text port:[self.portView.text intValue]];
    
    if (success) {
        self.isConnected = YES;
        [connectBtn setTitle:@"断开" forState:UIControlStateNormal];
        [connectBtn setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
        
        NSString *message = [NSString stringWithFormat:@"✅ 成功连接到 %@:%@", self.ipView.text, self.portView.text];
        [self appendToChatHistory:message];
        
        // 禁用IP和端口输入框
        self.ipView.enabled = NO;
        self.portView.enabled = NO;
    } else {
        NSString *message = [NSString stringWithFormat:@"❌ 连接失败 %@:%@", self.ipView.text, self.portView.text];
        [self appendToChatHistory:message];
    }
}

// 点击发送按钮
- (IBAction)sendClick:(id)sender {
    if (!self.isConnected) {
        [self appendToChatHistory:@"⚠️ 请先连接服务器"];
        return;
    }
    
    NSString *sendMessage = self.sendMsgView.text;
    if (sendMessage.length == 0) {
        [self appendToChatHistory:@"⚠️ 请输入要发送的消息"];
        return;
    }
    
    // 显示发送的消息
    NSString *sendDisplay = [NSString stringWithFormat:@"📤 发送: %@", sendMessage];
    [self appendToChatHistory:sendDisplay];
    
    // 发送并接收消息
    NSString *receiveMessage = [self sendAndRecv:sendMessage];
    
    // 显示接收的消息
    if (receiveMessage && receiveMessage.length > 0) {
        NSString *recvDisplay = [NSString stringWithFormat:@"📥 接收: %@", receiveMessage];
        [self appendToChatHistory:recvDisplay];
        
        // 更新原来的Label（保持兼容性）
        self.recvMsgView.text = receiveMessage;
    } else {
        [self appendToChatHistory:@"❌ 接收数据失败"];
    }
    
    // 清空输入框
    self.sendMsgView.text = @"";
}

// 点击关闭按钮
- (IBAction)closeClick:(id)sender {
    if (!self.isConnected) {
        return;
    }
    
    // 关闭连接
    close(self.clientSocket);
    self.isConnected = NO;
    
    [self appendToChatHistory:@"🔌 连接已断开"];
    
    // 恢复连接按钮状态
    UIButton *connectBtn = sender;
    if ([sender isKindOfClass:[UIButton class]]) {
        // 如果是从连接按钮调用的，更新按钮状态
        [connectBtn setTitle:@"连接" forState:UIControlStateNormal];
        [connectBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    }
    
    // 重新启用IP和端口输入框
    self.ipView.enabled = YES;
    self.portView.enabled = YES;
    
    NSLog(@"关闭连接");
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
    ssize_t recvCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收的字节数 %zd", recvCount);

    // 把字节数组转换成字符串
    NSData *data = [NSData dataWithBytes:buffer length:recvCount];
    NSString *recvMsg = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    return recvMsg;
}

@end
