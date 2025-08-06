//
//  ViewController.m
//  004UITableView展示多组数据
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

#pragma mark - /************** 数据源方法 *****************/
// 返回要显示多少组数据
// section标识的就是部分，章节
// 这里的参数是tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 要展示3组数据（亚洲，非洲，欧洲）
    return 3;
}


// 每一组有几条数据
// 这里的参数是section，表示第几组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 根据不同的组, 返回每组显示不同条数的数据
    if (section == 0) { // 亚洲
        return 3;
    } else if (section == 1) { // 非洲
        return 2;
    } else {
        return 1;
    }
}



// 每组的每行显示什么样的内容
// 这里的参数是indexPath, 表示当前单元格的位置，意思是第section组的第row行，indexPath.section表示组，indexPath.row表示行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建单元格
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    if (indexPath.section == 0) { // 第一组, 亚洲
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"中国";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"日本";
        } else {
            cell.textLabel.text = @"韩国";
        }
        
        
    } else if (indexPath.section == 1) { // 第二组, 非洲
        
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"南非";
        } else {
            cell.textLabel.text = @"索马里";
        }
        
    } else { // 第三组, 欧洲
        cell.textLabel.text = @"荷兰";
    }
    
    // 返回单元格
    return cell;
}


// 每一组的组标题显示什么
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 根据当前组的索引section, 返回不同组的标题
    if (section == 0) {
        return @"亚洲";
    } else if (section == 1) {
        return @"非洲";
    } else {
        return @"欧洲";
    }
}


// 每一组的"组尾"（组描述）
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 根据当前组的索引section, 返回不同组的描述信息
    if (section == 0) {
        return @"亚细亚洲, 日出的地方";
    } else if (section == 1) {
        return @"阿里非加州, 阳光灼热的地方";
    } else {
        return @"欧罗巴洲，鲜花盛开的地方，日落的地方。";
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
