//
//  ViewController.m
//  02-沙盒路径
//
//  Created by Romeo on 15/12/3.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController
/**
 应用沙盒结构分析
 应用程序包:
 包含了所有的资源文件和可执行文件
 
 Documents:
 保存应用运行时生成的需要持久化的数据,iTunes同步设备时会备份该目录。例,游戏应用可将游戏存档保存在该目录
 
 tmp：
 保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也可能会清除该目录下的文件。iTunes同步设备时不会备份该目录
 
 Library/Caches:
 保存应用运行时生成的需要持久化的数据, iTunes同步设备时不会备份该目录。一般存储体积大、不需要备份的非重要数据
 
 Library/Preference:
 保存应用的所有偏好设置, ios的Settings(设置)应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录
 */

- (void)viewDidLoad
{
    [super viewDidLoad];

    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/75E899ED-3236-484B-A1B5-075904543ABE
    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/E737FC46-9A6A-443C-A9FA-46B63EBA03D2

    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/29BEBF11-9E66-406A-969E-EFAE60C78976
    // 每运行一次，则HomeDirectory的值都不相同
    NSLog(@"%@", NSHomeDirectory());
}

// 地址是 /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/29BEBF11-9E66-406A-969E-EFAE60C78976/Documents/xx.plist
// 是在Documents目录下
- (IBAction)plistSave:(id)sender {
    // 获取 doc 路径

    // 1.1拼接字符串
    //    NSString* homePath = NSHomeDirectory();
    //    NSString* docPath = [homePath stringByAppendingString:@"/Documents"];
    // 1.2拼接字符串
    //        NSString* homePath = NSHomeDirectory();
    //    NSString * docPath = [homePath stringByAppendingPathComponent:@"Documents"];

    // 2.搜索的形式
    // SearchPath 搜索路径  ForDirectories 搜索哪个文件夹  InDomains 在哪个区域当中
//     1. NSSearchPathForDirectoriesInDomains 是iOS SDK提供的一个函数，用于查找指定目录的路径
   
//    - 第一个参数 NSDocumentDirectory 指定要查找的目录类型为Documents目录，该目录用于存储用户生成的内容，会被iTunes备份
//    - 第二个参数 NSUserDomainMask 指定搜索范围为当前用户的主目录（即应用沙盒）
//    - 第三个参数 YES 表示返回的路径应该使用全路径的形式，如果是NO则是波浪号展开的形式（在iOS中，这通常返回完整路径）
// 2. 函数返回一个NSString类型的数组， [0] 表示获取数组中的第一个元素，即Documents目录的完整路径
// 3. 从代码上下文可以看出，获取Documents路径后，程序通过 stringByAppendingPathComponent 方法拼接了一个名为"xx.plist"的文件路径，并将一个字典写入该文件
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];

    // 拼接文件路径
    NSString* filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];

    // 数组
    //    NSArray* array = @[ @"1", @"321", @"德玛西亚" ];
    //    [array writeToFile:filePath atomically:YES];

    // 字典
    NSDictionary* dict = @{ @"name" : @"demaxiya" };
    [dict writeToFile:filePath atomically:YES]; // 写入文件

    NSLog(@"%@", docPath);
    
}

- (IBAction)plistRead:(id)sender {
    // 获取 doc 路径
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    // 获取文件路径
    NSString* filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];

    // 解析
    //    NSArray* array = [NSArray arrayWithContentsOfFile:filePath];

    // 解析文件内容为字典
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:filePath];

    NSLog(@"%@", dict);
}

// /Users/xuhai/Library/Developer/CoreSimulator/Devices/4C7298BD-0C62-4E88-A034-6918E94A0F86/data/Containers/Data/Application/B87F0AEF-F781-42E1-8F07-4EB9729E7159/Library/Preferences/com.itheima.-2-----.plist
// 地址在Library下面的Preferences下面，也是一个plist文件，文件名默认为是应用的Bundle Identifier.plist
- (IBAction)preferenceSave:(id)sender {
    // 1.不需要关心文件夹和文件的名字
    // 2.快速做键值对
    // 3.用法和字典基本一样

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"Blend" forKey:@"name"];
    [ud setBool:YES forKey:@"isOn"];

    [ud synchronize]; // 立即写入
    
}


- (IBAction)referenceRead:(id)sender {
    // 获取 ud 单例对象
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];

    NSLog(@"%@", [ud objectForKey:@"name"]);
    NSLog(@"%@", [ud boolForKey:@"isOn"] ? @"YES" : @"NO");

}

// 存储在tmp目录下，也叫做归档解档
// 归档解档（Archiving/Unarchiving）是iOS开发中一种对象序列化与反序列化的机制，用于将对象转换为二进制数据以便存储或传输，以及从二进制数据中恢复对象。
- (IBAction)tmpSave:(id)sender {
    // 获取 tmp目录
    NSString* tmpPath = NSTemporaryDirectory();
    // 获取 file path
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];

    // 创建自定义对象
    Teacher* t = [[Teacher alloc] init];
    t.name = @"德玛西亚";
    t.age = 18;

    // 归档
    [NSKeyedArchiver archiveRootObject:t toFile:filePath];
    
    NSLog(@"tmp filePath: %@",filePath);
}
- (IBAction)tmpRead:(id)sender {
    // 获取 tmp目录
    NSString* tmpPath = NSTemporaryDirectory();
    // 获取 file path
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];

    Teacher* t = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", t.name);
}


@end
