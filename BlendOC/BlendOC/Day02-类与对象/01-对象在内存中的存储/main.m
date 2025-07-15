/*
 
  1. 内存中的五大区域.
 
     栈 存储局部变量.
     堆 程序员手动申请的字节空间 malloc calloc realloc函数.
     BSS段 存储未被初始化的全局变量 静态变量.
     数据段(常量区) 存储已被初始化的全局 静态变量 常量数据.
     代码段 存储代码. 存储程序的代码.
 
 
 
  2. 类加载.
 
     1). 在创建对象的时候 肯定是需要访问类的.
 
     2). 声明1个类的指针变量也会访问类的.
 
 
     在程序运行期间 当某个类第1次被访问到的时候. 会将这个类存储到内存中的代码段区域.这个过程叫做类加载.
 
     只有类在第1次被访问的时候,才会做类加载.
     一旦类被加载到代码段以后. 直到程序结束的时候才会被释放.
 
 
  3. 对象在内存中究竟是如何存储的.
 
     假设下面这个写在函数之中.
     Person *p1 = [Person new];
 
 
    1). Person *p1; 会在栈内存中申请1块空间. 在栈内存中声明1个Person类型的指针变量p1。
                    p1是1个指针变量.  那么只能存储地址.
 
 
    2). [Person new]; 真正在内存中创建对象的其实是这句代码.
 
                  new做的事情
 
                  a. 在堆内存中申请1块合适大小的空间.
                  b. 在这个空间中根据类的模板创建对象.
 
                     类模板中定义了什么属性.就把这些属性依次的声明在对象之中.
                     对象中还有另外1个属性 叫做isa 是1个指针. 指向对象所属的类在代码段中的地址.
                     isa其实是is a的缩写，表示对象与类之间的归属关系，本质：它是一个指针，存在于每个 Objective-C 对象的头部，指向对象所属的类（Class）。
        isa 的作用
        （1）动态消息派发
        当调用对象方法时（如 [obj method]），运行时系统会：

        通过 isa 找到对象的类。

        在类的方法列表中查找对应的方法实现。

        若未找到，沿继承链向上搜索（通过父类的 isa）。

        （2）运行时类型检查
        isKindOfClass: 和 isMemberOfClass: 等方法依赖 isa 指针判断对象的类型。

                  c. 初始化对象的属性
                     如果属性的类型是基本数据类型 那么就赋值为0
                     如果属性的类型是C语言的指针类型 那么就赋值为NULL
                     如果属性的类型是OC的类指针类型 那么就赋值为nil
 
                  d. 返回对象的地址.
 
    3). 注意
 
         a. 对象中只有属性,而没有方法. 自己类的属性外加1个isa指针指向代码段中的类.
 
         b. 如何访问对象的属性
            指针名->属性名;
 
            根据指针 找到指针指向的对象 再找到对象中的属性来访问.
 
         c. 如何调用方法.
            [指针名 方法名];
 
            先根据指针名找到对象,对象发现要调用方法 再根据对象的isa指针找到类.
            然后调用类里的方法.
 
 
 
 
  4. 为什么不把方法存储在对象之中?
 
     因为每1个对象的方法的代码实现都是一模一样的  没有必要为每1个对象都保存1个方法 这样的话就太浪费空间了.
     既然都一样 那么就只保持1份.
 
 
 
  5. 对象的属性的默认值.
 
     如果我们创建1个对象,没有为对象的属性赋值. 那么这个对象的属性是有值的.
 
     如果属性的类型是基本数据类型 默认值是0
     如果属性的类型是C指针类型 那么默认值是NULL
     如果属性的类型是OC指针类型  那么默认值是nil
 
 
 Objective-C 常用格式说明符
 说明符         类型                                       示例
 %@            Objective-C 对象（调用 description 方法）    NSLog(@"%@", obj);
 %d, %i        32 位有符号整数（int）                       NSLog(@"%d", 42);
 %u            32 位无符号整数（unsigned int）              NSLog(@"%u", 100U);
 %ld, %li      64 位有符号整数（long）                      NSLog(@"%ld", 100L);
 %lu           64 位无符号整数（unsigned long）             NSLog(@"%lu", 100UL);
 %lld, %lli    64 位有符号整数（long long）                 NSLog(@"%lld", 100LL);
 %llu          64 位无符号整数（unsigned long long）        NSLog(@"%llu", 100ULL);
 %f            浮点数（float/double，默认 6 位小数）         NSLog(@"%f", 3.14);
 %c            单个字符（char）                            NSLog(@"%c", 'A'); → A
 %s            C 字符串（char *，以 \0 结尾）               NSLog(@"%s", "Hello");
 %p            指针地址（十六进制）                         NSLog(@"%p", obj); → 0x600000123456
 @C            打印 Unicode 字符 的格式说明符，打印非 ASCII 字符（必须用 %C）
 
 
 
 
 */

#import <Foundation/Foundation.h>


@interface Person: NSObject
{
    @public
    NSString *_name;
    int _age;
    int *_p1;
}

- (void)sayHi;

@end

@interface Dog : NSObject
{
    @public
    NSString *_name;
    int age;
}
- (void) eat:(NSString *)food;
@end

@implementation Person

- (void)sayHi
{
    NSLog(@"大家好,我叫%@，我今年%d岁",_name,_age);
}

@end

@implementation Dog
- (void) eat:(NSString *)food{
    NSLog(@"我是狗狗，我在吃%@", food);
}
<#methods#>

@end


int main(int argc, const char * argv[])
{
   
    Person *p1 = [Person new];
    Person *p2 = [Person new];
    Person *p3 = [Person new];
   // p1->_name = @"jack";
//    
//    
//    [p1 sayHi];
//    
//    
//    
//  
//    NSLog(@"p1 = %p",p1);
    
    
    Dog *dog = [Dog new];
    dog->_name = @"大黄";
    dog->age = 12;
    [dog eat:@"狗粮"];
    
    return 0;
}
































