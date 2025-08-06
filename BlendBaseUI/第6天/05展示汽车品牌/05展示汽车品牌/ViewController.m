//
//  ViewController.m
//  05展示汽车品牌
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZGroup.h"
@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)groups
{
    if (_groups == nil) {
        // 懒加载数据
        // 找到plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
        // 加载plist文件，将plist文件中的内容转成字典数组
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        // 把字典转成模型
        NSMutableArray *arrayModel = [NSMutableArray array];
        // 遍历字典数组中的每个字典, 把每个字典转成模型, 把模型放到arrayModel数组中
        for (NSDictionary *dict in arrayDict) {
            // 创建模型对象
            CZGroup *model = [CZGroup groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _groups = arrayModel;
    }
    
    return _groups;
}



#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1. 根据组索引(section)获取组对象
    CZGroup *group = self.groups[section];
    return group.cars.count;
}


// 返回每一组的每一行的内容（单元格UITableViewCell）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 获取模型数据
    // 获取组模型
    CZGroup *group = self.groups[indexPath.section];
    // 获取对应的汽车品牌
    NSString *brand = group.cars[indexPath.row];
    
    
    // 2. 创建单元格UITableViewCell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 3. 把模型中的数据设置给单元格中的子控件
    // 把汽车品牌设置给单元格中的Label
    cell.textLabel.text = brand;
    
    
    // 4. 返回单元格UITableViewCell
    return cell;
    
}


// 设置组标题的数据源方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CZGroup *group = self.groups[section];
    return group.title;
}

// 设置组描述的数据源方法
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CZGroup *group = self.groups[section];
    return group.desc;
}


#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
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












