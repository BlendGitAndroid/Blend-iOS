/*
  1. 里氏替换原则 --- LSP
 
     子类可以替换父类的位置.并且程序的功能不受影响.
 
     为什么?
     1). 父类指针迫切的需求要1个父类对象,而我们给了1个子类对象,
         这是完全没有问题的. 因为子类就是1个父类嘛.
 
     2). 因为父类中拥有的成员 子类都有. 所以不会影响程序的功能.
 
 
  2. 里氏替换原则的表现形式.
 
     当1个父类指针指向1个子类对象的时候,这里就有里氏替换原则.
 
 
  3. LSP的作用。
 
     1). 1个指针中不仅可以存储本类对象的地址还可以存储子类对象的地址.
 
     2). 如果1个指针的类型是NSObject类型的,那么这个指针中可以存储任意的OC对象的地址.
 
     3). 如果1个数组的元素的类型是1个OC指针类型的 那么这个数组中不仅可以存储本类对象还可以存储子类对象.
 
     4). 如果1个数组的元素是NSObject指针类型 那么意味着任意的OC对象都可以存储到这个数组之中.
 
     5). 如果1个方法的参数是1个对象,那么我们在为这个参数传值的时候.
         可以传递1个本类对象 也可以传递1个子类对象.
         对方法中的代码不会有丝毫的影响.
 
 
  4. 当1个父类指针指向1个子类对象的时候.
     这个时候,通过这个父类指针就只能去调用子类对象中的父类成员.
     子类独有的成员无法访问.
 
     只需要记住,不要问为什么 时机一到我自然会告诉你!
 
 
 
 
 
 */


#import <Foundation/Foundation.h>
#import "ItCastStu.h"
#import "God.h"


int main(int argc, const char * argv[])
{
    
    Person *p1 = [Student new];
    [p1 study];
    
    
    
    
    
//    God *ys = [God new];
//    
//    Person *p1 = [Person new];
//    [p1 setName:@"大狗"];
//    
//    Student *s1 = [Student new];
//    [s1 setName:@"小明"];
//    
//    
//    ItCastStu *stu = [ItCastStu new];
//    [stu setName:@"小东"];
//    
//    [ys killWithPerson:stu];
//    
//    
    
//    NSObject *objs[4];
//    objs[0] = [Person new];
//    objs[1] = [Student new];
//    objs[2] = [ItCastStu new];
//    objs[3] = @"jack";
//    
    
//    Person *ps[3];
//    ps[0] = [Person new];
//    ps[1] = [Student new];
//    ps[2] = [ItCastStu new];
    
//    NSObject *obj = 1;
//    
//    
//    Person *p1 = [Student new];
//    
    
//    Person *p2 = [Student new];
//    [p2 setName:@"jack"];
//    [p2 setAge:19];
//    [p2 setHeight:187.4];
//    [p2 setWeight:67.4f];
//    
//    [p2 sayHi];
//  
    
    return 0;
}
