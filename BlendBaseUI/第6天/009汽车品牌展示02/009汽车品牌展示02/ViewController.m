//
//  ViewController.m
//  009汽车品牌展示02
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZGroup.h"
#import "CZCar.h"

// UITableViewDataSource这个协议的作用是提供数据，也就是为UITableView提供方法
@interface ViewController () <UITableViewDataSource>
// 用来保存所有的组信息
@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController


#pragma mark - 数据源方法

// 返回一共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

// 返回每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CZGroup *group = self.groups[section];
    // 返回每一组有多少辆车
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 获取模型数据
    // 根据组的索引获取对应的组的模型
    CZGroup *group = self.groups[indexPath.section];
    // 根据当前行的索引, 获取对应组的对应行的车
    CZCar *car = group.cars[indexPath.row];
    
    
    
    // 2. 创建单元格
    // 2.1 声明一个重用ID，这里的声明需要用static修饰
    static NSString *ID = @"car_cell";
    // 2.2 根据重用ID去缓存池中获取对应的cell对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.3 如果没有获取到, 那么就创建一个
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 3. 设置单元格内容
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    // 4. 返回单元格
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 获取组模型
    CZGroup *group = self.groups[section];
    return group.title;
}


// 设置UITableView右侧的索引栏，返回的数据是NSArray*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    NSMutableArray *arrayIndex = [NSMutableArray array];
//    for (CZGroup *group in self.groups) {
//        [arrayIndex addObject:group.title];
//    }
    
    //return arrayIndex;
    
    // valueForKeyPath: 可以通过keyPath来获取属性
    // valueForKeyPath: 是 Foundation 框架提供的强大方法，当用于集合对象（如 NSArray）时，它会返回一个新数组，其中包含集合中每个元素对应键路径的值。这里的 @"title" 表示获取每个 CZGroup 对象的 title 属性。相比循环方式， valueForKeyPath: 更加简洁高效，是 Objective-C 中常用的代码优化技巧。这段代码的最终作用是为表格视图提供右侧索引栏的标题数据。
    return [self.groups valueForKeyPath:@"title"];
}


#pragma mark - 懒加载数据，字典转模型，将最外层的字典转换为模型
- (NSArray *)groups
{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        // 这个Array数组里面的每一个数据，就是NSDictionary类型
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZGroup *model = [CZGroup groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _groups = arrayModels;
    }
    return _groups;
}


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
