/*
  1. SEL 全称叫做  selector 选择器.
     SEL 是1个数据类型. 所以要在内存中申请空间存储数据.
     SEL其实是1个类. SEL对象是用来存储1个方法的.
     记住，SEL其实是一个类，是用于存储一个方法的，方法是以SEL对象的方式存储的，先根据方法拿到SEL对象，再将这个消息发送给对象
 
  2. 类是以Class对象的形式存储在代码段之中.
 
     类名:存储的这个类的类名. NSString 
 
     还要将方法存储在类对象之中.如何将方法存储在类对象之中.
 
     1). 先创建1个SEL对象.
     2). 将方法的信息存储在这个SEL对象之中.
     3). 再将这个SEL对象作为类对象的属性.
 
 
  3. 拿到存储方法的SEL对象.
 
     1). 因为SEL是1个typedef类型的 在自定义的时候已经加*了.
         所以 我们在声明SEL指针的时候 不需要加*
 
     2). 取到存储方法的SEL对象,使用的时候，使用@selector
         SEL s1 = @selector(方法名);
 
 
  4. 调用方法的本质.
    
      [p1 sayHi];
      内部的原理:
      1). 先拿到存储sayHi方法的SEL对象，也就是拿到存储sayHi方法的SEL数据. SEL消息.
 
      2). 将这个SEL消息发送给p1对象.
 
      3). 这个时候,p1对象接收到这个SEL消息以后 就知道要调用方法
 
      4). 根据对象的isa指针找到存储类的类对象.
 
      5). 找到这个类对象以后 在这个类对象中去搜寻是否有和传入的SEL数据相匹配的.
          如果有 就执行  如果没有再找父类 直到NSObject
 
 
      OC最重要的1个机制:消息机制.
      调用方法的本质其实就是为对象发送SEL消息.
      [p1 sayHi]; 为p1对象发送1条sayHi消息.
 
  5. 重点掌握:
     1).方法是以SEL对象的形式存储起来.
     2).如何拿到存储方法的SEL对象.
 
 
 
  6. 手动的为对象发送SEL消息.
 
     1). 先得到方法的SEL数据.
 
     2). 将这个SEL消息发送给p1对象.
 
         调用对象的方法 将SEL数据发送给对象.
         - (id)performSelector:(SEL)aSelector;
 
        Person *p1 = [Person new];
        SEL s1 = @selector(sayHi);
        [p1 performSelector:s1]; 与 [p1 sayHi]效果是完全一样的.
 
 
     3). 调用1个对象的方法有两种.
       1). [对象名 方法名];
 
       2). 手动的为对象发送SEL消息.
 
 
  7. 注意事项:
 
 
     1). 如果方法有参数 那么方法名是带了冒号的.
      
     2). 如果方法有参数,如何传递参数.
         那么就调用另外1个方法.
 
 - (id)performSelector:(SEL)aSelector withObject:(id)object;
 - (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
 
 
     3). 如果有多个参数 
 
 ---------------------------------
 
 1. 类是以Class对象的形式存储在代码段.
 
 2. 如何取到存储类的类对象.
 
 3. 如何使用类对象调用类的类方法 
 
 4. 方法是以SEL数据的形式存储的.
 
 5. 调用方法的两种方式.
 
 
   顿悟.
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p1 = [Person new];
    
    
    Params *ps = [Params new];
    
    
    SEL s1 = @selector(testWith:); // 如果方法有参数，那就是带冒号的
    
    [p1 performSelector:s1 withObject:ps];
    
    
    
    
    //SEL s1 = @selector(eatWithFood:);
    
    
    
    
//    [p1 sb];
//    SEL s2 = @selector(sb);
//    [p1 performSelector:s2];
//    
//    
//    [p1 eatWithFood:@"后果烧肉"];
//    
//    
//    
//    SEL s1 = @selector(sayHi);
//    
//    [p1 performSelector:s1];
//    [p1 sayHi];
//    
//    
    
    

    
    
    
    

//    SEL s1 = @selector(sayHi);
//    NSLog(@"s1 = %p",s1);
//    
//    Person *p1 = [Person new];
//    [p1 sayHi];
    
    
    return 0;
}
