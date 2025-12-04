//
//  HMLiveController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMLiveController.h"
#import "UIView+Frame.h"

@interface HMLiveController ()

@property(nonatomic, weak) UIDatePicker *datePicker;
@property(nonatomic, strong) UITextField *dateTextField;
@property(nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation HMLiveController

// 比赛直播推送
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// didSelectRowAtIndexPath 是 UITableViewDelegate 协议中的一个关键方法，用于
// 响应表视图单元格的点击事件
// 在iOS开发中，将时间选择器(UIDatePicker)与TextField绑定是一种常见且高效的实现方式，主要基于以下原因：
// ### 1. iOS输入机制的工作原理
// - inputView机制 ：iOS的 UITextField 和 UITextView 等输入控件提供了 inputView
// 属性，允许开发者自定义输入视图来替代系统键盘。
// - 自动弹出/收起 ：当控件成为第一响应者( becomeFirstResponder
// )时，系统会自动弹出其 inputView ；当结束第一响应者状态时，自动收起。
// ### 2. 直接显示UIDatePicker的局限性
// - 无系统动画 ：直接添加 UIDatePicker
// 到视图需要手动实现弹出/收起动画，效果不如系统原生流畅。
// - 无输入辅助 ：无法利用系统提供的输入辅助视图( inputAccessoryView
// )，需要自己实现完成/取消等按钮及逻辑。
// - 键盘冲突 ：可能与页面中的其他输入控件键盘弹出产生冲突。
// - 状态管理复杂 ：需要手动处理显示/隐藏状态，容易出现bug。
// ### 3. TextField绑定方式的优势
// - 利用系统原生机制 ：直接使用iOS提供的 inputView
// 机制，无需自己实现弹出/收起逻辑。
// - 自动动画效果 ：继承系统键盘的弹出/收起动画，提供一致的用户体验。
// - 支持辅助视图 ：可以通过 inputAccessoryView 轻松添加完成/取消等操作按钮。
// - 简化状态管理 ：通过TextField的第一响应者状态自动管理选择器的显示/隐藏。
// - 统一输入处理 ：可以利用TextField的输入事件处理选择器的值变化。
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return;
    }

    self.selectedIndexPath = indexPath;

    // 1. 先移除旧的
    if (self.dateTextField) {
        [self.dateTextField removeFromSuperview];
        self.dateTextField = nil;
    }

    // 2. 创建并配置 UITextField（不能是 CGRectZero！）
    UITextField *tempTextField = [[UITextField alloc] init];
    tempTextField.hidden = YES; // 隐藏但存在
    [self.view addSubview:tempTextField];

    // 3. 创建 datePicker
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datePicker.datePickerMode = UIDatePickerModeTime;

    // iOS 14+ 适配
    if (@available(iOS 13.4, *)) {
        datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }

    // 4. 创建 toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleDefault;

    // 关键设置：避免约束冲突
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;

    // 添加高度约束
    [toolbar.heightAnchor constraintEqualToConstant:44].active = YES;

    UIBarButtonItem *cancelItem =
        [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(cancelClick)];

    // 拉伸
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                             target:nil
                             action:nil];

    UIBarButtonItem *doneItem =
        [[UIBarButtonItem alloc] initWithTitle:@"完成"
                                         style:UIBarButtonItemStyleDone
                                        target:self
                                        action:@selector(doneClick)];

    toolbar.items = @[ cancelItem, flexSpace, doneItem ];

    // 5. 设置 textField 的 inputView 和 inputAccessoryView
    tempTextField.inputView =
        datePicker; // 绑定 datePicker, 输入框绑定自定义视图
    tempTextField.inputAccessoryView = toolbar; // 在输入框上方显示辅助工具栏

    // 6. 保存引用
    self.dateTextField = tempTextField;
    self.datePicker = datePicker;

    // 7. 延迟显示（很重要）
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
          [self.dateTextField becomeFirstResponder];
        });
}

// 收键盘
- (void)cancelClick {
    [self.view endEditing:YES];
}

// 完成按钮点击事件
- (void)doneClick {

    // 获取 datePicker 的时间
    NSDate *date = self.datePicker.date;
    // 创建格式化时间的对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式化时间对象的格式
    formatter.dateFormat = @"HH:mm";
    // 把date 转成 string
    NSString *time = [formatter stringFromDate:date];

    // 获取 indexPath
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];

    // 获取 cell
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];

    // 修改时间
    cell.detailTextLabel.text = time;

    // 点取消
    [self cancelClick];
}

@end
