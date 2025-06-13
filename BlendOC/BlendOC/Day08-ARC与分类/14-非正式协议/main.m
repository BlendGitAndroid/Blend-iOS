/*
  1. 分类的作用在于可以将我们写类分为多个模块.
 
     可以不可以为系统的类写1个分类呢?
 
     为系统自带的类写分类 这个就叫做非正式协议.
 
 
  2. 分类的第2个作用:
      为1个已经存在的类添加方法.
 
 
  3. NSString类都挺好的. 就是差了1个方法.
 
     统计字符串对象中有多少个阿拉伯数字.
 
 
 
 
 
  分类的作用
 
  1). 将臃肿的类分为多个模块 方便管理.
 
  2). 扩展1个类.
 
 
 */
#import <Foundation/Foundation.h>
#import "NSObject+itcast.h"
#import "Person.h"
#import "NSString+itcast.h"


int main(int argc, const char * argv[])
{
    
    NSString *str = @"e2ehi2ehi23h1i3h12i34hi21h41";
    
    int count =  [str numberCount];
    NSLog(@"%d",count);
    
    //2个字节.
//    unichar ch =  [str characterAtIndex:1];
//   
//    NSLog(@"ch = %C",ch);
    
    
    
    
//    //思路:
//    //遍历字符串中的每1个字符,判断每1个字符是否为阿拉伯数字.
//    
//    int count = 0;
//    for(int i = 0; i < str.length; i++)
//    {
//       unichar ch =   [str characterAtIndex:i];
//        if(ch >= '0' && ch <= '9')
//        {
//            count++;
//        }
//    }
//    
//    NSLog(@"%d",count);
//    
    
    
    
    
    
    
   
//    Person *p1 = [Person new];
//
//    [p1 run];
//
//    NSString *str = @"jack";
//    [str run];
    
    
    return 0;
}
