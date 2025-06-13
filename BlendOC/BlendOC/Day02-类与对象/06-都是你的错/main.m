/*
  1. 最容易犯错
 
     1).  @interface是类的声明. @implementation是类的实现 他们之间不能相互嵌套
 
     2).  类必须要先声明然后再实现
 
     3).  类的声明和实现必须都要有 就栓没有方法 类的实现也不必不可少的.
 
     4).  类的声明必须要放在使用类的前面.
          实现可以放在使用类的后面

 
     5).  声明类的时候 类的声明和实现必须要同时存在.
          特殊情况下可以只有实现 没有声明.
 
          虽然可以这样,但是我们平时在写类的时候千万不要这么写 因为这么写是极度不规范的 会被别人曹晓的.
 
 
     6)  属性名一定要以下划线开头 这是规范. 否则后面的知识点你就对不上号.
         类名 每1个单词的首字母大写.
 
 
     7). 属性不允许声明的时候初始化
 
         在为类写1个属性的时候 不允许在声明属性的时候为属性赋值.
 
 
     8).  OC方法必须要创建对象通过对象名来调用
 
 
 
     9).   方法只有声明 没有实现
 
 
          a. 如果方法只有声明 没有实现  编译器会给1个警告  不会报错.
 
          b. 如果指针指向的对象 有方法的声明 而没有方法的实现 那么这个时候通过指针来调用这个方法
 
              在运行的时候  就会报错.
 
        
            unrecognized selector sent to instance 0x100420510
 
            只要你看到了这个错误.说明要么对象中根本就没有这个方法. 要么只有方法的声明而没有方法的实现.
 
 
 
 
 
 
 
 
 


 





 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>

@interface XueSheng : NSObject
{
    NSString *_stuNumber;
}

- (void)study;

@end

@implementation XueSheng


@end


//
//@interface Student : NSObject
//{
//    NSString *_stuNumber;
//    NSString *_name;
//    int _age;
//}
//
//@end

//@implementation Student : NSObject
//{
//        NSString *_stuNumber;
//        NSString *_name;
//        int _age;
//}
//
//- (void)sayHi
//{
//    NSLog(@"哈哈哈哈哈哈哈哈哈");
//}
//
//@end




int main(int argc, const char * argv[])
{
    
    XueSheng *x1 = [XueSheng new];
    [x1 study];
    
    
//    [s1 sayHi];
//    
    
    return 0;
}







