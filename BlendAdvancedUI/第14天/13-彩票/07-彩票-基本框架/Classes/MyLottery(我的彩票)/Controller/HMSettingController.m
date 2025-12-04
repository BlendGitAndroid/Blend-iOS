//
//  HMSettingController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMSettingController.h"
#import "HMRedeemController.h"
#import "HMSettingCell.h"

#import <MessageUI/MessageUI.h>

@interface HMSettingController () <MFMessageComposeViewControllerDelegate>

@property(nonatomic, strong) NSArray *groups;

@end

@implementation HMSettingController

// 默认是 grouped 样式
- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:style];
}

- (NSArray *)groups {
    if (!_groups) {
        // 获取路径
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName
                                                         ofType:@"plist"];

        // 解析成数组
        // arrayWithContentsOfFile 会自动解析 plist 文件, 并返回一个数组
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建返回按钮
    UIBarButtonItem *item =
        [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"]
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(backClick)];

    // 设置 leftbaritem
    self.navigationItem.leftBarButtonItem = item;
}

// 点击 cell 调用
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // 获取组，每一组都是一个Dictionary
    NSDictionary *group = self.groups[indexPath.section];
    // 获取所有的 cell
    NSArray *items = group[@"items"];
    // 获取当前的 cell 信息，还是一个Dictionary
    NSDictionary *item = items[indexPath.row];

    // 如果有需要跳转的ViewController
    if (item[@"targetVC"] && [item[@"targetVC"] length] > 0) {
        NSString *targetVC = item[@"targetVC"]; // @"HMRedeemController"
        // 把字符串转化成一个类,NSClassFromString是Objective-C运行时（Runtime）提供的一个核心函数，其主要功能是通过类名字符串动态获取对应的类对象。
        Class Clz = NSClassFromString(targetVC); // HMRedeemController
        // 实例化一个对象
        UIViewController *vc =
            [[Clz alloc] init]; // HMRedeemController类型的对象

        if ([vc isKindOfClass:[HMSettingController class]]) {
            // 如果 setting 类型的 需要传入一个 plistname
            HMSettingController *setting = (HMSettingController *)vc;
            setting.plistName = item[@"plistName"];
        }

        // 设置跳转过去的标题
        vc.navigationItem.title = item[@"title"]; // 设置 title

        // 跳转到别的viewController
        [self.navigationController pushViewController:vc animated:YES];
    }

    if (item[@"funcName"] && [item[@"funcName"] length] > 0) {
        // 执行 item[@"funcName"] 方法

        // 把字符串转化成一个方法
        // NSSelectorFromString是Objective-C运行时（Runtime）提供的核心函数，用于将字符串动态转换为选择器（Selector）。选择器是Objective-C中用于唯一标识方法名的机制。
        // 例如：@"funcName" 字符串会被转换为 funcName: 选择器
        // 相同名字的方法会有相同的SEL，无论它们属于哪个类,SEL只包含方法名，不包含参数类型和返回值类型，如
        // funcName 与 funcName: 是不同的SEL
        SEL funcName = NSSelectorFromString(item[@"funcName"]);

        //        #pragma clang diagnostic push
        //        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        // 执行方法
        [self performSelector:funcName];
        //        #pragma clang diagnostic pop
    }
}

// 有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

// 某一组有多少行
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    // 获取组
    NSDictionary *group = self.groups[section];
    // 获取当前组 所有的 cell 信息
    NSArray *items = group[@"items"];
    return items.count;
}

// cell长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取当前 cell 的信息 ----
    // 1.获取组
    NSDictionary *group = self.groups[indexPath.section];
    // 2.获取当前组的所有的 cell 信息
    NSArray *items = group[@"items"];
    // 3.当前 cell 的信息，也就是modal
    NSDictionary *item = items[indexPath.row];

    // 创建cell
    HMSettingCell *cell = [HMSettingCell settingCellWithTableView:tableView
                                                          andItem:item];

    // 把数据传给 cell
    //    cell.item = item;

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView
    viewForHeaderInSection:(NSInteger)section {

    NSLog(@"%ld", (long)section);

    return nil;
}
// header 信息
- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
    // 获取需要展示 header 的组
    NSDictionary *group = self.groups[section];

    return group[@"header"];
}

// footer 信息
- (NSString *)tableView:(UITableView *)tableView
    titleForFooterInSection:(NSInteger)section {
    // 获取需要展示 header 的组
    NSDictionary *group = self.groups[section];
    return group[@"footer"];
}

// 检查新版本
- (void)checkUpdate {
    NSLog(@"你已经是最新的版本了");
}

// 打电话
- (void)makeCall {
    // 获取 app
    UIApplication *app = [UIApplication sharedApplication];
    // 协议头是 tel
    NSURL *url = [NSURL URLWithString:@"tel://10010"];
    if (@available(iOS 10.0, *)) {
        [app openURL:url options:@{} completionHandler:nil];
    } else {
        [app openURL:url]; // 通过 open url 打电话
    }
}

// 发短信
- (void)makeSms {
    //    // 获取 app
    //    UIApplication * app =[UIApplication sharedApplication];
    //    // 协议头是  sms
    //    NSURL * url = [NSURL URLWithString:@"sms://10010"];
    //    [app openURL:url]; // 通过 open url 发短信

    MFMessageComposeViewController *picker =
        [[MFMessageComposeViewController alloc] init];

    picker.messageComposeDelegate = self;

    picker.navigationBar.tintColor = [UIColor blackColor];

    picker.body = @"test";

    picker.recipients = [NSArray arrayWithObject:@"10010"];

    [self presentViewController:picker animated:YES completion:nil];
}

// 短信发送完成的时候调用
- (void)messageComposeViewController:
            (MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {

    NSLog(@"%zd", result);
}

// 评分支持
- (void)mark {
    // 获取 app
    UIApplication *app = [UIApplication sharedApplication];
    // 协议头是
    NSURL *url = [NSURL
        URLWithString:@"https://itunes.apple.com/cn/app/id414478124?mt=8&ls=1"];
    if (@available(iOS 10.0, *)) {
        [app openURL:url options:@{} completionHandler:nil];
    } else {
        [app openURL:url]; // 通过 open url 跳转到应用商店
    }
}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
