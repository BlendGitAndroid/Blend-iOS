//
//  ViewController.m
//  04图片浏览器
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *pic;



// 自己写一个索引， 来控制当前显示的是第几张图片
// 这个属性一开始没有赋值就是0
@property (nonatomic, assign) int index;



- (IBAction)next;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnPre;

- (IBAction)pre;
@end

@implementation ViewController

// 重写pic属性的get方法
//------------- 懒加载数据 -----------------
- (NSArray *)pic
{
    if (_pic == nil) {
        // 写代码加载pic.plist文件中的数据到_pic
        // 1. 获取pic.plist文件的路径
        // 获取pic.plist文件的路径赋值给path变量
        // [NSBundle mainBundle]表示获取这个app安装到手机上时的根目录
        // 然后在app的安装的根目录下搜索pic.plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        // 读取文件
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _pic = array;
    }
    return _pic;
    
    
    
    NSDictionary *dict1 = @{@"name" : @"张三", @"age" : @18, @"height" : @180};
    
    NSDictionary *dict2 = @{@"name" : @"李四", @"age" : @19, @"height" : @190};
    
    NSDictionary *dict3 = @{@"name" : @"王五", @"age" : @17, @"height" : @178};
    
    NSArray *students = @[dict1, dict2, dict3];
    
    NSLog(@"%@", students);
    
    
    
}

// 控制器的view加载完毕以后执行的方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.index = -1;
    
    // 下一张图片
    [self next];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 下一张图片
- (IBAction)next {
    // 1. 让索引++
    self.index++;
    
    // 设置控件数据
    [self setData];
}

// 显示上一张
- (IBAction)pre {
    // 1. 让索引++
    self.index--;
    
    // 设置控件数据
    [self setData];
}


// 设置控件数据
- (void)setData
{
    // 2. 从数组中获取当前这张图片的数据
    NSDictionary *dict = self.pic[self.index];
    
    
    // 3. 把获取到的数据设置给界面上的控件
    self.lblIndex.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.pic.count];
    // 通过image属性来设置图片框里面的图片
    self.imgViewIcon.image = [UIImage imageNamed:dict[@"icon"]];
    
    // 设置这张图片的标题
    self.lblTitle.text = dict[@"title"];
    

    
    // 控制上一张与下一张按钮是否可用
    self.btnPre.enabled = (self.index != 0);
    self.btnNext.enabled = (self.index != (self.pic.count - 1));
}
@end













