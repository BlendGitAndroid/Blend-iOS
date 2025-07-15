/*
 
   1. 我们刚才讲的@private修饰的属性就叫做私有属性.
      只能在类的内部访问.
 
      但是在外界的时候,Xcode仍然会提示这个对象中有这个属性 只不过没权访问.
 
      我们想要实现的效果:真私有. 让外界不知道对象里面有这么1个属性.
 
 
    
   2. 其实在@implementaion之中也可以写1个大括弧.
      把属性定义在@implementation的大括弧之中.
 
      这里面的属性. 是1个私有属性. 各种访问修饰符无效.
      外界根本就不会提示.
 
      将属性定义在@implementation之中 和 将属性定义在@interface之中并标记为@private
      唯一的区别: 提示和不提示. 都不能在外界访问.
 
    
   3. 私有方法.
      
      方法不写声明,只写实现. 那么这个方法就是1个私有方法.
      只能在本类的其他方法中调用 不能再外界调用.
      这个才是真私有
 
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Girl.h"

int main(int argc, const char * argv[])
{
    Person *p1 = [Person new];
   // [p1 sayHi];
    
    Girl *g1 = [Girl new];
    [g1 showMyBest];
//    g1 -> _name;
    
    
    return 0;
}
