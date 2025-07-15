/*
  1. 创建对象,我们之前说:
        
     类名 *指针名 =  [类名  new];
 
     new实际上是1个类方法.
 
     new方法的作用:
     -> 创建对象。
     -》 初始化对象
     -> 把对象的地址返回.
 
 
     new方法的内部,其实是先调用的alloc方法. 再调用的init方法.
 
     alloc方法是1个类方法,作用: 那1个类调用这个方法 就创建那个类的对象,并把对象返回.
     init方法 是1个对象方法,作用: 初始化对象.
 
     创建对象的完整步骤:
     应该是先使用alloc创建1个对象,然后再使用init初始化这个对象 才可以使用这个对象.
     虽然没有初始化的对象 有的时候 也可以使用. 但是千万不要这么做.
     使用1个未经初始化的对象是极其危险的.
 
     Person *p1 = [Person new];
     完全等价于
     Person *p1 = [[Person alloc] init];
 
     
  2. init方法.
 
     作用: 初始化对象,为对象的属性赋初始值 这个init方法我们叫做构造方法.
 
          init方法做的事情:初始化对象.
          为对象的属性赋默认值.
 
          如果属性的类型是基本数据类型就赋值为0
                        C指针           NULL
                        OC指针          nil
 
     所以.我们创建1个对象如果没有为这个对象的属性赋值 这个对象的属性是有默认值的.
     所以,我们每次新创建1个对象,这个对象的属性都被初始化了.
 
 
  3. 我们想要让创建的对象的属性的默认值不是 nil NULL 0
     而是我们自定义的.
     那么这个时候,我们就可以重写init方法. 在这个方法中按照我们自己的想法为对象的属性赋值.
 
     重写init方法的规范:
     1). 必须要先调用父类的init方法.然后将方法的返回值赋值给self
 
     2). 调用init方法初始化对象有可能会失败,如果初始化失败.返回的就是nil
 
     3). 判断父类是否初始化成功. 判断self的值是否为nil 如果不为nil说明初始化成功.
 
     4). 如果初始化成功 就初始化当前对象的属性.
 
     5). 最后 返回self的值.
 
 
     解惑
     1). 为什么要调用父类的init方法.
         因为父类的init方法 会初始化父类的属性. 所以必须要保证当前对象中的父类属性也同时被初始化.
 
     2). 为什么要赋值给self？
         因为.调用父类的init方法 会返回初始化成功的对象
         实际上返回的就是当前对象。但是我们要判断是否初始化成功.
 
     无论如何,记住重写init方法的规范.
 
     - (instancetype)init
     {
         if(self = [super init])
         {
            //初始化当前类的属性的代码;
         }
         retrun self;
     }
 
     什么时候需要重写init方法:
     如果你希望创建出来的对象的属性的默认值不是 nil NULL 0 而是我们指定的值.
     那么这个时候我们就可以重写init方法.
 
 
 
 3.  重写init方法以后.
     稍稍不爽的: 这样每次创建出来的对象的属性的值都是一样的.
 
     创建对象的时候,对象的属性的值由创建对象的人来指定.而不是写死在init方法中
 
 
     自定义构造方法.
 
     规范:
     1). 自定义构造方法的返回值必须是instancetype
     2). 自定义构造方法的名称必须以initWith开头.
     3). 方法的实现和init的要求一样.
 
 
     什么时候要自定义构造方法?
     self只能在构造方法中赋值
 
 
 
 
 为什么是警告而非错误？
 （1）Objective-C 的弱类型检查
 Objective-C 本质上是一种 动态类型语言，编译器对类型匹配的检查较为宽松。
 虽然 Desk 和 NSString 类型不匹配，但编译器会将其视为 潜在的类型不兼容（Incompatible pointer types），而非直接阻止编译。

 （2）指针赋值的通用性
 所有 Objective-C 对象本质上都是 id 类型（通用对象指针），编译器允许任意对象指针之间赋值（尽管可能不安全）。
 例如，以下代码也是合法的（但有警告）：

 objectivec
 NSArray *array = [[UIButton alloc] init]; // 警告但能编译
 
 （3）运行时而非编译时绑定
 Objective-C 的方法调用（消息发送）在运行时才确定，编译器无法在编译阶段保证 Desk 是否真的实现了 NSString 的方法。因此它只能提示风险，而非直接禁止。
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Student.h"
#import "Desk.h"

int main(int argc, const char * argv[])
{
    
    
    NSString *str  = [[Desk alloc] init];
    
//    Dog *d1 = [[Dog alloc] initWithName:@"小黄" andAge:2];
//    
//    
//    Dog *d2 = [Dog new];
//    d2.name = @"小黄";
//    d2.age = 2;
//    
//    
//    Person *p1 = [[Person alloc] initWithName:@"小明" andAge:19 andWeight:56.3f andHeight:175.4f];
//    
//    
//    
//    
    
    
//    Student *s1 = [Student new];
//    [s1.dog shout];
    
//    
//    Dog *d1 = [Dog new];
//    Dog *d2 = [[Dog alloc] init];
//    
//    
    
    
//
//   // Person *p1 = [Person new];
//    
//    Person *p1 =  [[Person alloc] init];
//    
//    Person *p2 = [[Person alloc] init];
//
//    
//    Person *p3 = [Person new];
//    
    
    return 0;
}
