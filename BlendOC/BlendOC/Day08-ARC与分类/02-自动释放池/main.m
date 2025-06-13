/*
  1. 自动释放池的原理.
 
     存入到自动释放池中的对象,在自动释放池被销毁的时候.会自动调用存储在该自动释放池中的所有对象的release方法.
 
     可以解决的问题:
     将创建的对象,存入到自动释放池之中. 就不再需要手动的relase这个对象了.
     因为池子销毁的时候 就会自动的调用池中所有的对象的relase。
 
 
     自动释放池的好处: 将创建的对象存储到自动释放池中,不需要再写release
 
 
  2. 如何创建自动释放池.
 
     @autoreleasepool
     {
 
     }
 
     这对大括弧代表这个自动释放池的范围.
 
  3. 如何将对象存储到自动释放池之中
     
     在自动释放池之中调用对象的autorelease方法.就会将这个对象存入到当前自动释放池之中.
 
     这个autorealse方法返回的是对象本身. 所以,我们可以这么写
        
     @autoreleasepool
     {
        Person *p1 = [[[Person alloc] init] autorelease];
     }
 
     这个时候,当这个自动释放池执行完毕之后,就会立即为这个自动释放池中的对象发送1条release消息.
 
     目前为止,我们感受到得autorelase的好处:
     创建对象,调用对象的autorelase方法 将这个对象存入到当前的自动释放池之中.
 
     我们就不需要再去relase 因为自动释放池销毁的时候 就会自动的调用池中所有对象的relase
 
  4. 使用注意
 
     1). 只有在自动释放池中调用了对象的autorelease方法,这个对象才会被存储到这个自动释放池之中.
         如果只是将对象的创建代码写在自动释放之中,而没有调用对象的autorelease方法.是不会将这个对象存储到这个自动释放池之中的.
 
     2). 对象的创建可以在自动释放池的外面,在自动释放池之中,调用对象的autorelease方法,就可以将这个对象存储到这个自动释放池之中.
 
     3). 当自动释放池结束的时候.仅仅是对存储在自动释放池中的对象发送1条release消息 而不是销毁对象.
 
     4). 如果在自动释放池中,调用同1个对象的autorelease方法多次.就会将对象存储多次到自动释放池之中.
         在自动释放池结束的时候.会为对象发送多条release消息.那么这个是就会出现僵尸对象错误.
         所以,1个自动释放池之中,只autorelease1次,只将这个对象放1次, 否则就会出现野指针错误.
 
     5). 如果在自动释放池中,调用了存储到自动释放中的对象的release方法.
         在自动释放池结束的时候,还会再调用对象的release方法. 
         这个时候就有有可能会造成野指针操作.
    
         也可以调用存储在自动释放池中的对象的retain方法.
 
 
     6). 将对象存储到自动释放池,并不会使对象的引用计数器+1
         所以其好处就是:创建对象将对象存储在自动释放池,就不需要在写个release了.
 
     7).  自动释放池可以嵌套.
          调用对象的autorelease方法,会讲对象加入到当前自动释放池之中
          只有在当前自动释放池结束的时候才会像对象发送release消息.
 
 5. autorelease的规范.
     0). 创建对象,将对象存储到自动释放池之中. 就不需要再去手动的realse。
 
 
     1). 类方法的第1个规范:
         一般情况下,要求提供与自定义构造方法相同功能的类方法.这样可以快速的创建1个对象.
 
 
    
     2). 我们一般情况下,写1个类. 会为我们的类写1个同名的类方法,用来让外界调用类方法来快速的得到1个对象.
         规范:使用类方法创建的对象,要求这个对象在方法中就已经被autorelease过了.
         这样,我们只要在自动释放池中, 调用类方法来创建对象, 那么创建的对象就会被自动的加入到自动释放中.
        
         提供1个类方法来快速的得到1个对象.
         规范
         a. 这个类方法以类名开头. 如果没有参数就直接是类名 如果有参数就是 类名WithXX:
         b. 使用类方法得到的对象,要求这个对象就已经被autorelease过了.
 
         + (instancetype)person
         {
            return [[[self alloc] init] autorelease];
         }
 
         这样,我们直接调用类方法.就可以得到1个已经被autorelease过的对象.
         @autoreleasepool
         {
             Person *p1 = [Person person];
             //这个p1对象已经被autorelase过了.不需要再调用autorelase
             //这个p1对象就被存储到当前自动释放池之中.
         }//当自动释放池结束.就会为存储在其中的p1对象发送release消息.
 
 6. 实际上Apple的框架中的类也是遵守这个规范的.
 
    通过类方法创建的对象都是已经被autorelease过的了.
 
    所以,我们也要遵守这个规范. 类方法返回的对象也要被autorealse过.
 
    以后,我们凡事创建对象是调用类方法创建的对象 这个对象已经是被autorelease过的了.
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Pig.h"

int main(int argc, const char * argv[])
{
   
    
    
    @autoreleasepool
    {
        Pig *p1 = [Pig pigWithName:@"猪猪" andAge:1 andWeight:100];
        
        
        
        NSString *str0 = [[[NSString alloc] initWithFormat:@"jack"] autorelease];
     
        NSString *str1 = [NSString stringWithFormat:@"jack"];

    }
    
    
    
//    NSString *str = [NSString alloc] initWithFormat:<#(nonnull NSString *), ...#>;
//    [NSString string];
    
//    
//    Pig *p1 = [[Pig alloc] initWithName:@"八戒" andAge:2 andWeight:260];
//    
//    Pig *p2 = [Pig pigWithName:@"八戒" andAge:2 andWeight:260];
//    
    
    
    
//    @autoreleasepool
//    {
//        Person *p1 = [[[Person alloc] init] autorelease];
//
//        Car *c1 = [[[Car alloc] init] autorelease];
//        
//        p1.car = c1;
//    }
//    
    
    
    
    
    //自动释放池唯一的作用: 省略创建对象匹配的那个release
    //其他的和我们昨天讲的都是一样的.
    
//    @autoreleasepool
//    {
//        Person *p1 = [[[Person alloc] init] autorelease];
//        @autoreleasepool
//        {
//        
//            Person *p2 = [[[Person alloc] init] autorelease];
//            
//            @autoreleasepool
//            {
//                 Person *p3 = [[[Person alloc] init] autorelease];
//            }
//            
//        }
//        
//        
//    }
//    
//    
    
    
//    @autoreleasepool
//    {
//        
//        Person *p1 = [[[Person alloc] init] autorelease];//1
//        
//     
//        
//        //在自动释放池中调用同1个对象的autorelease多少次 就会降这个对象存储到自动释放池中多少词.
//        
//        
//        //[p1 retain];//2
//        //[p1 autorelease];//将p1对象 存储到当前的自动释放池
//        
//        
//    }
    
    
//    Person *p1 =  [Person new];
//    
//    
//    [p1 release];
    

    
    return 0;
}
