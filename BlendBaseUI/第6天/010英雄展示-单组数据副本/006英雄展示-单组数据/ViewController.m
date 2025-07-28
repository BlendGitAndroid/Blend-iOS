//
//  ViewController.m
//  006英雄展示-单组数据
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZHero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

// 保存英雄的集合
@property (nonatomic, strong) NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController



#pragma mark - 代理方法
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    int rowNum = indexPath.row;
//    if (rowNum % 2 == 0) {
//        return 60;
//    } else {
//        return 120;
//    }
//}

// 当点击了alertview上的按钮的时候会执行这个方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"%ld", (long)buttonIndex);
    if (buttonIndex == 1) {
        // 表示点击的是"确定"
        // 更新数据
        // 1. 获取用户文本框中输入的内容
        NSString *name = [alertView textFieldAtIndex:0].text;
        
        
        // 2. 找到对应的英雄模型
        CZHero *hero = self.heros[alertView.tag];
        
        
        // 3. 修改英雄模型的name
        hero.name = name;
        
        // 4. 刷新tableView(重新刷新数据的意思就是重新调用UITableView的数据源对象中的那些数"据源方法")
        // reloadData表示刷新整个tableView
        //[self.tableView reloadData]; // 重新刷新table view
        
        // 局部刷新, 刷新指定的行
        // 创建一个行对象
        NSIndexPath *idxPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }
}


// 监听行被选中的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取当前被选中的这行的英雄的名称
    CZHero *hero = self.heros[indexPath.row];
    
    
    
    // 创建一个对话框对象
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"编辑英雄" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 把当前行的索引保存到alertview的Tag中
    alertView.tag = indexPath.row;
    
    // 修改UIAlertViwe的样式, 显示出一个文本框来
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    // 获取那个文本框, 并且设置文本框中的文字为hero.name
    [alertView textFieldAtIndex:0].text = hero.name;
    
    // 显示对话框
    [alertView show];
}




#pragma mark - 懒加载数据
- (NSArray *)heros
{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZHero *model = [CZHero heroWithDict:dict];
            [arrayModels addObject:model];
        }
        _heros = arrayModels;
    }
    return _heros;
}

#pragma mark - 数据源方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 获取模型数据
    CZHero *model = self.heros[indexPath.row];

    // 2. 创建单元格
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // 3. 把模型数据设置给单元格
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.intro;

    
    // 要在单元格的最右边显示一个小箭头, 所以要设置单元格对象的某个属性
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 可以自定义单元格右边的accessory。
    //cell.accessoryView = [[UISwitch alloc] init];
    
    // 4. 返回单元格
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // 统一设置UITableView的所有行的行高
    // 如果每行的行高是一样的, 那么通过rowHeight统一设置行高效率更高
    self.tableView.rowHeight = 60;
    
    // 对于每行的行高不一样的情况, 无法通过tableView.rowHeight来实现
    // 此时, 只能通过一个代理方法来实现。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
