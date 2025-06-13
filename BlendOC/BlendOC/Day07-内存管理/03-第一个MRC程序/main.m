/*
  1. iOS5开始. Xcode4.2开始就支持ARC
     Xcode7 默认支持ARC开发.
     默认使用的开发方式就是ARC的模式.
 
     关闭ARC开启MRC.
 
 
  2. 当对象的引用计数器变为0的时候,系统会自动回收对象.
     在系统回收对象的时候.会自动的调用对象的dealloc方法.
 
     重写dealloc方法的规范:
     必须要调用父类的dealloc方法. 并且要放在最后一句代码.
 
 
  3. 测试引用计数器.
 
     1). 新创建1个对象,这个对象的引用计数器的值默认是1.
     2). 当对象的引用计数器变为0的时候.对象就会被系统立即回收 并自动调用dealloc方法.
     3). 为对象发送retain消息 对象的引用计数器就会+1
 
 
 
 
  4. 为对象发送release消息.并不是回收对象.而是让对象的引用计数器-1
     当对象的引用计数器的值变为0的时候.对象才会被系统立即回收.
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p1 = [[Person alloc] init];
    p1.name = @"小明";
    NSUInteger count = [p1 retainCount];
    NSLog(@"count = %lu",count);
    
    
    [p1 retain];
     NSLog(@"count = %lu",p1.retainCount);
    
    
    [p1 release];
    NSLog(@"count = %lu",p1.retainCount);

    
    [p1 release];
    
    return 0;
}
