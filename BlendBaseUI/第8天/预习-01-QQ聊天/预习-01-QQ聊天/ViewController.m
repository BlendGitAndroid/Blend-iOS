//
//  ViewController.m
//  预习-01-QQ聊天
//
//  Created by js on 14/11/28.
//  Copyright (c) 2014年 czbk. All rights reserved.
//

#import "ViewController.h"

#import "CZMessage.h"
#import "CZMessageFrame.h"
#import "CZMessageCell.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

// 用来保存所有的消息的frame模型对象
@property (nonatomic, strong) NSMutableArray *messageFrames;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - /********** 懒加载数据 *********/
- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        
        NSArray *messages = [CZMessage messagesList];
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (CZMessage *message in messages) {
            CZMessageFrame *frame = [[CZMessageFrame alloc] init];
            frame.message = message;
            [tmpArray addObject:frame];
        }
        _messageFrames = tmpArray;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    // 添加点击手势隐藏键盘
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    
    // 订阅键盘通知，通过通知中心，无论谁发出的键盘通知，都进行接受
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWiddChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}


// 视图布局完成后调用
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // 滚动到最后一行
    if (self.messageFrames.count > 0) {
        NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}
// 点击界面隐藏键盘
- (void)dismissKeyboard {
    [self.view endEditing:YES];
}
// ***************** 注意: 监听通知以后一定要在监听通知的对象的dealloc方法中移除监听 *************/.

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 键盘通知的接收方法
- (void)keyboardWiddChangeFrame:(NSNotification *)noti
{
    // 1. 获取当键盘显示完毕或者隐藏完毕后的Y值
    CGRect keyboardFrameEnd = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    // 确定动画时间
    CGFloat duration = [noti.userInfo[@""] floatValue];
    
    // 用键盘的Y值减去屏幕的高度计算出平移的值
    // 1. 如果是键盘弹出事件, 那么计算出的值就是负的键盘的高度
    // 2. 如果是键盘的隐藏事件, 那么计算出的值就是零， 因为键盘在隐藏以后, 键盘的Y值就等于屏幕的高度。
    CGFloat y = keyboardFrameEnd.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        // 让控制器的View执行一次“平移”
        // 使用Transfrom来进行平移
        self.view.transform = CGAffineTransformMakeTranslation(0, y);
    }];
    
    
    
//    {
//        UIKeyboardAnimationCurveUserInfoKey = 7;
//        UIKeyboardAnimationDurationUserInfoKey = "0.25";
//        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
//        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 538}";
//        UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 796}";
//        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
//        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
//    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"......");
    CZMessageCell *cell = [CZMessageCell messageCellWithTableView:tableView];
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}

#pragma mark - tableView的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.rowHeight;
}

#pragma mark - /********** UITableView的代理方法 *********/
// 当开始拖动的时候，隐藏键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - /********** 文本框的代理方法，监听右下角按钮的点击 *********/
// 代理的设置，是在storyboard中的，不是在代码里写的
// Auto-enable Return Key 勾选上，如果输入框有值，则按钮是亮的，否则处于不可点击状态
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self sendMsg:textField.text messageType:CZMessageTypeSelf];
    
    // 发送完清空文字
    textField.text = nil;
    
    // 自动回复
    [self sendMsg:@"嘻嘻嘻" messageType:CZMessageTypeOther];

    return YES;
}



- (void)sendMsg:(NSString *)text messageType:(CZMessageType)type
{
    CZMessageFrame *frame = [[CZMessageFrame alloc] init];

    CZMessage *msg = [[CZMessage alloc] init];
    msg.type = type;
    msg.text = text;
    
    //获取当前时间
    NSDate *date = [NSDate date];
    //格式化日期对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    msg.time = [formatter stringFromDate:date];
    
    
    //判断当前消息的时间和上一次消息的时间是否一样
    CZMessageFrame *lastMsgFrame = [self.messageFrames lastObject];
    CZMessage *lastMsg = lastMsgFrame.message;
    if ([msg.time isEqualToString:lastMsg.time]) {
        msg.hiddenTime = YES;
    }
    
    
    frame.message = msg;
    [self.messageFrames addObject:frame];
    
    //刷新表格
    [self.tableView reloadData];
    
    //发完消息后滚动到最后一行
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}
@end
