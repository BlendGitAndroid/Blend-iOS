/*
 
  1. NSFileManger是Foundation框架提供的1个类.   
     这个类作用: 用来操作磁盘上的文件 文件夹  对他们进行创建、删除、复制 拷贝 移动.....
 
  2. NSFileManager是1个类.
     这个类的对象是以单例模式创建的.
     如何得到NSFileManager的1个单例对象.
     掉用这个类的类方法,defaultManager 就可以得到这个类的单例对象
     NSFileManager *fileManager = [NSFileManager defaultManager];
 
  3. 常用方法之 判断.
     1). 判断指定的文件或者文件夹在磁盘上是否真实的存在
        - (BOOL)fileExistsAtPath:(NSString *)path;
 
     2).判断指定的路径是否真实的存储在我们的磁盘之上,并且判断这个路径是1个文件夹路径还是1个文件路径.
        - (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory;
        返回值:代表这个路径是否真实存在.
        参数指针: 代表这个路径是否是1个文件夹路径
     
     3). 判断指定的文件夹或者文件是否可以读取.
         - (BOOL)isReadableFileAtPath:(NSString *)path;
 
     4). 判断指定的文件夹或者文件是否可以写入.
         - (BOOL)isWritableFileAtPath:(NSString *)path;
 
     5). 判断指定的文件夹或者文件是否可以删除.
         - (BOOL)isDeletableFileAtPath:(NSString *)path
 
 4. 常见方法之 获取信息.
    1).获取指定文件或者文件夹的属性信息.
       - (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error
       返回的是1个字典,如果要拿到特定的信息 通过key
 
    2).获取指定目录下的所有的文件和目录. 是拿到指定目录下的所有的文件和目录 所有的后代目录和文件.
       子目录的子目录的子目录 所有的都可以拿到.
       - (NSArray *)subpathsAtPath:(NSString *)path;
 
    3).获取指定目录下的所有的子目录和文件 不保护孙子辈.
       - (NSArray *)contentsOfDirectoryAtPath:(NSString *)path error:(NSError **)error
 
 5. 常见方法之 文件/目录的创建
    
    1). 在指定的目录创建文件.
        - (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr
        第1个参数: 要创建的文件的路径.
        第2个参数: 这个文件的内容.  要传递这个文件的二进制格式. 
                  这个二进制的数据格式 使用NSData对象来封装.
 
                  NSData: 将别的格式的数据转换为二进制数据.
    
                  将字符串转换为NSData二进制的方式.调用字符串对象的
                   - (NSData *)dataUsingEncoding:(NSStringEncoding)encoding
                   编码参数: NSUTF8StringEncoding
                  指定1个编码 就可以将字符串转换为二进制数据 存储在NSData对象之中.
 
                  最后再将这个二进制对象通过这个方法写入.
 
                  如果想创建1个空文件 第2个参数就给nil
 
        第3个参数: 指定创建的文件的属性.如果想要使用系统的默认值使用nil
 
    2). 在指定的目录创建文件夹.
        - (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError **)error
 
        第1个参数: 路径.
        第2个参数: YES,做一路创建. 如果是NO就不会做一路创建.
        第3个参数: 指定属性 nil为系统默认属性.
        第4个参数.
 
    3).拷贝文件.
       - (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error
    
    4).移动文件 剪切 文件的重命名. 重名的原理: 将文件移动到原来的目录并改名.
       - (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error
 
    5).删除文件.
       - (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error
 
      注意 删除的文件不会倒废纸篓 而是直接删除,所以请小心使用.
 
 
 
 
 
 
 */
#import <Foundation/Foundation.h>
#define LogBOOL(val) NSLog(@"%@",val==YES?@"YES":@"NO")

int main(int argc, const char * argv[])
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL res =  [manager removeItemAtPath:@"/Users/Apple/Desktop/dict.plist" error:nil];
    
    LogBOOL(res);
    
//    BOOL res =  [manager moveItemAtPath:@"/Users/Apple/Desktop/haha.txt" toPath:@"/Users/Apple/Desktop/heihei.txt" error:nil];
//    LogBOOL(res);
//    
    
//    BOOL res =  [manager copyItemAtPath:@"/Users/Apple/Desktop/abc.plist" toPath:@"/Users/Apple/abc.plist" error:nil];
//
//    LogBOOL(res);
    
    
    
    
    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    BOOL res = [manager createDirectoryAtPath:@"/Users/Apple/Desktop/AA/DD/CC/BB/ZZ" withIntermediateDirectories:YES attributes:nil error:nil];
//    
//    if(res == YES)
//    {
//        NSLog(@"成功!");
//    }
//    else
//    {
//        NSLog(@"失败!");
//    }
//    
    
    
    
    
    
    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    //存储在磁盘上得任何文件都是以二进制的形式存储的.
//    //第2个参数是文件的内容. 要求是文件的二进制的内容.
//    //NSData对象就是专门用来保存二进制数据的.
//    
//    NSString *str = @"我爱北京天安门";
//    NSData *data =  [str dataUsingEncoding:NSUTF8StringEncoding];
//    
//    BOOL res = [manager createFileAtPath:@"/Users/Apple/Desktop/haha.txt" contents:nil attributes:nil];
//    
//    if(res == YES)
//    {
//        NSLog(@"成功!");
//    }
//    else
//    {
//        NSLog(@"失败!");
//    }
//    
    
    
    
    
    
    
    
//      NSFileManager *manager = [NSFileManager defaultManager];
//     NSArray *arr =   [manager contentsOfDirectoryAtPath:@"/Users/apple/Documents" error:nil];
//      // NSArray *arr =  [manager subpathsAtPath:@"/Users/Apple/Desktop/1010IOS基础班"];
//    
//      for(NSString *str in arr)
//      {
//          NSLog(@"%@",str);
//      }
//    
//    
    
    
//      NSDictionary *dict =  [manager attributesOfItemAtPath:@"/Users/Apple/Desktop/abc.plist" error:nil];
//    
//      NSLog(@"%@",dict[NSFileSize]);
    
    
    
//        BOOL res = [manager isDeletableFileAtPath:@"/System"];
//       LogBOOL(res);
    
//    BOOL res = [manager isReadableFileAtPath:@"/Users/test/Desktop"];
//    LogBOOL(res);
//    
    
    
    
    /* 判断指定的路径是否存在 并判断路径是否为1个文件夹路径.
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *path = @"/Users/Apple/Desktop/dd1";
    
    BOOL flag = NO;
    BOOL res = [manager fileExistsAtPath:path isDirectory:&flag];
    //先判断是否存在.
    if(res == YES)
    {
        NSLog(@"给定的路径是存在的!");
        //再判断路径是1个文件路径还是1个文件夹路径.
        if(flag == YES)
        {
            //说明给定的路径是1个 文件夹路劲
            NSLog(@"这是1个文件夹");
        }
        else
        {
            //说明给定的路径是1个 文件路劲
            NSLog(@"这是1个文件");
            
        }
        
    }
    else
    {
        NSLog(@"给定的路径不存在.");
    }
     */
    
    
    
   

    
    
    
//    BOOL res =  [manager fileExistsAtPath:path];
//    
//    LogBOOL(res);
    

    
    return 0;
}
