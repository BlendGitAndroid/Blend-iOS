/*
  1. NSString类
 
     1). NSString的本质是1个类.
     2). @"jack"; 是1个NSString对象.
     3). 字符串的恒定性.
     4). 最常用的5个方法. 
     5). 其他方法.
 
  2. NSMutableString
 
     1). 是NSString的子类.
     2). 可变.
     3). 使用场景. 大批量的字符串拼接的时候.
 
  3. NSArray
     1). 数组.
     2). 特点
     3). 创建 取出 遍历 其他的常用.
 
  4. NSMutableArray
     1). 是NSArray的子类.
 
     2). 元素可以新增和删除.
 
 
  5. NSNumber
 
 ----------------------------------
 
  1. 将数组的信息(数组的元素的值)保存起来.保存在磁盘上.
     数据持久化.
 
 
 
  2. plist文件.属性列表文件.
     这个文件可以保存数组. 把数组中的元素保存在这个文件中.
 
 
  3. 原理:
     1). 将数组的信息存储到plist文件中. 就会将数组的所有的元素存储到这个文件中.
 
     - (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
 
 
     2). 将plist文件中的数据还原为1个数组.
    
     + (nullable NSArray<ObjectType> *)arrayWithContentsOfFile:(NSString *)path;
 
 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    NSArray *arr = [NSArray arrayWithContentsOfFile:@"/Users/Appl11e/Desktop/abc.plist"];
    if(arr != nil)
    {
        for(NSString *str in arr)
            NSLog(@"%@",str);

    }
    
    
//    
//    NSArray *arr = @[@"jack",@"rose",@"lili",@"lucy"];
//    
////
//  [arr writeToFile:@"/Users/Apple/Desktop/abc.plist" atomically:NO];
////    NSLog(@"YES");
//    

    
    
    
    
    return 0;
}
