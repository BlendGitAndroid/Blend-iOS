/*
  1. 我们之前创建对象的做法.
     Person *p1 = [Person new];
     让1个指针指向1个对象 这个指针就叫做这个对象的名字.
 
 
  2. 匿名对象.
     没有名字的对象,如果我们创建1个对象,没有用1个指针存储这个对象的地址.
     也就是没有任何指针指向这个对象 那么这个对象就叫做匿名对象。
 
 
  3. 如何去使用1个匿名对象呢?
 
     因为new实际上1个类方法. 这个方法做的事情创建对象(4个步骤). 返回值是创建的对象的地址.
     [Person new] 这句代码的结果实际上就是创建的那个对象的指针. 那我们可以直接使用.
 
     [Person new]->_name = @"jack";
     [[Person new] sayHi];
 
 
  4. 注意点.
 
     1). 匿名对象只能使用1次. 
 
     2). 每次创建匿名对象都是不同的对象 。
         [Person new]->_name = @"jack"；
         创建了1个对象
         
         [Person new]->_age = 18;
         又创建了1个对象
         [[Person new] sayHi];
         第3个对象.
 
  5.有神马用?
 
    1). 如果某个对象的成员只会被我们使用1次.用完之后这个对象再也不需要了 那么就可以使用匿名对象.
 
    2). 如果方法的参数是1个对象,而调用者为这个参数赋值的对象 就是专门来给这个方法传递的
        并且这个对象调用者不会使用 那么这个时候就可以直接为方法传递1个匿名对象 。
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "God.h"



int test()
{
    return 10;
}

int main(int argc, const char * argv[])
{
    
    God *ys = [God new];
    
    
    
    [ys killWithPerson:[Person new]];
    
    
//    Person *p2 = [Person new];
//    
////    [Person new]->_name = @"jack";
////    
////    
////    
////    [Person new]->_age = 18;
//    
//    [[Person new] sayHi];
    
    
    return 0;
}















