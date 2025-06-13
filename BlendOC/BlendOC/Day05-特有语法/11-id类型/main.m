/*
  
  1. NSObject.
     是OC中所有类的基类.根据LSP NSObject指针就可以指向任意的OC对象.
     所以.NSObject指针是1个万能指针.可以执行任意的OC对象.
    
     缺点: 如果要调用指向的子类对象的独有的方法.就必须要做类型转换.
 
 
  2. id指针.
     是1个万能指针,可以指向任意的OC对象.
 
     1). id是1个typedef自定义类型 在定义的时候已经加了*
         所以,声明id指针的时候不需要再加*了.
 
     2)  id指针是1个万能指针,任意的OC对象都可以指.
 
 
  3. NSObject和id的异同.
 
     相同点: 万能指针 都可以执行任意的OC对象.
 
     不同点: 通过NSObject指针去调用对象的方法的时候.编译器会做编译检查.
            通过id类型的指针去调用对象的方法的时候,编译器直接通过.无论你调用什么方法.
 
     
     注意: id指针只能调用对象的方法  不能使用点语法.如果使用点语法就会直接报编译错误 。
     如果我们要声明1个万能指针 千万不要使用NSObject 而是使用id
 
  4. 父类中的类方法创建1个父类对象返回.
 
     1). 如果返回值写为父类类型的.那么子类来调用这个方法得到的就是父类指针.
         解决的方式: 把返回值改为id类型的.
 
     2). 方法的内部创建的对象的是 不要写死. 因为写死创建的对象就固定了.
         我们希望那1个类来调用这个方法就创建那1个类的对象.
 
         把类名写为self 那1个类来调用这个方法 self就指的是那1个类.创建的就是那1个类的对象.
 
     3). 方法的返回值是id类型的.问题就是任意指针都可以接收这个方法的返回值.
         编译器连个警告都没有.
 
         如果方法的返回值是instancetype
         代表方法的返回值是当前这个类的对象.
 
 
 
     5). 使用建议
 
         1). 如果方法内部是在创建当前类的对象,不要写死成类名 【类名 new】;
             而是用self代替类名.
 
         2). 如果方法的返回值是当前类的对象,也不要写死了. 而是写instancetype
 
 
 
     6). id和instancetype的区别.
 
         1).instancetype只能作为方法的返回值.不能在别的地方使用.
            id既可以声明指针变量 也可以作为参数 也可以作为返回值.
 
         2). instancetype 是1个有类型的 代表当前类的对象.
            id是1个无类型的指针 仅仅是1个地址.没有类型的指针.
 
 
 
 */


#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{
    
    
    BOOL res = [Student instancesRespondToSelector:@selector(sb)];
    
    NSLog(@"res = %d\n",sb);
    
//    
//    NSString *str =  [Person person];
//    
//    
//    
//    
//    Student *s1 =  [Student person];
//    
//    Person *p1 = [Person person];
//    [p1 sayHi];
//    
//    
//    Student *s1 =  [Student person];
//    
//    [s1 study];
//    
    
    
//    NSObject *obj = [Person new];
//    
//   
//    
//    id id1 = [Person new];
//    [id1 setName:@"jack"];
//    [id1 sayHi];
//    
//    
//    
//    Person *p1 = [Person new];
//    p1.name = @"jack";
    
    
    
//    id id1 = [Person new];
//    id id2 = [Student new];
//    id id3 = @"jack";
//    
   
    
//    NSObject *obj1 = [Person new];
//    
//    [(Person *)obj1 sayHi];
//   
//    NSObject *obj2 = [Student new];
//    [(Student *)obj2 study];
//    
//    NSObject *obj3 = @"jack";
//    [(NSString *)obj3 length];
    
    
    
    return 0;
}
