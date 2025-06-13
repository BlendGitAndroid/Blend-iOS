/*
  1.定义1个类.
 
    分为类的声明和实现
 
    @interface 类名 : NSObject
    {
        属性 属性表示类的特征.
    }
    方法的声明; 方法表示类的功能.
    @end
 
 
    @implementation 类名
    方法的实现;
    @end
 
 
  2.1类事物不仅具有相同的特征还具有相同的行为.
 
    行为就是1个功能. C语言中使用函数来表示1个功能.
    OC的类具有的行为,我们使用方法来表示..
 
 
    方法和函数都表示1个功能.
 
 
 
 
  3. 无参数的方法.
 
 
     1). 声明
 
         a. 位置: 在@interface的大括弧的外面.
 
         b. 语法: 
            - (返回值类型)方法名称;
            - (void)run;
            表示声明了1个无返回值并且无参数的方法 方法名字叫做run
 
 
     2). 实现
 
         a.位置: 在@implementation之中实现
 
         b.实现的语法:
 
           将方法的声明拷贝到@implementation之中.去掉分号 追加大括弧1对 将方法实现的代码写在大括弧之中.
 
 
     3).调用
 
         a. 方法是无法直接调用的.因为类是不能直接使用的.必须要先创建对象.
            那么这个对象中就有类中的属性和方法了 就可以调用对象的方法了.
 
         b. 调用对象的方法.
    
 
             [对象名 方法名];
 
 
 4.带1个参数的方法.
 
    1). 声明
 
        a.位置: 在@interface的大括弧的外面.
 
        b.语法:
          - (返回值类型)方法名称:(参数类型)形参名称;
          - (void)eat:(NSString *)foodName;
 
          定义了1个方法 这个方法没有返回值.
          这个方法的名字叫做eat:
          这个方法有1个参数,类型是NSString *类型的 参数的名字叫做foodName
 
 
 
         - (void)eat:(NSString *)foodName;
 
         void eat(NSString *foodName);
 
 
 
 
 
 
    2). 实现
 
        a.位置: 在@implementation之中实现
 
        b.语法: 将方法的声明拷贝到@implementation之中.去掉分号 追加大括弧1对 将方法实现的代码写在大括弧之中.
 
 
    3). 调用
 
         a. 方法是无法直接调用的.因为类是不能直接使用的.必须要先创建对象.
         那么这个对象中就有类中的属性和方法了 就可以调用对象的方法了.
 
 
         b. 调用语法:
 
            [对象名 方法名:实参];
 
         
 
     方法头中的数据类型都要用1个小括弧括起来.
 
     - (返回值类型)方法名称:(参数类型)参数名称;
 
 
 
 5.带多个参数的方法.
 
   1) 声明
 
       a.位置: 在@interface的大括弧的外面.
    
       b. 语法:
 
        - (返回值类型)方法名称:(参数类型)形参名称1 :(参数类型)参数名称2 :(参数类型)参数名称3;
 
        - (int)sum:(int)num1 :(int)num2;
 
        表示声明了1个方法 这个方法的返回值类型是int类型的.
        方法的名称叫做 sum: :
        有两个参数 参数类型都是int类型 参数名称叫做num1 num2
 
 
 
    2).实现.
       
        a. 位置: 在@implementation之中实现
    
        b. 实现的语法: 将方法的声明拷贝到@implementation之中.去掉分号 追加大括弧1对 将方法实现的代码写在大括弧之中.
 
 
 
    3).调用:
 
         a. 方法是无法直接调用的.因为类是不能直接使用的.必须要先创建对象.
         那么这个对象中就有类中的属性和方法了 就可以调用对象的方法了.

 
 
         b. 调用带多个参数的语法
 
         [对象名 方法名:实参1 :实参2 :实参3];
         
 
 
 
 6. 带参数的方法声明的规范:
 
 
    1). 如果方法只有1个参数. 要求最好这个方法的名字叫做 xxxWith:
        xxxWithxxx
 
        eatWith:
        eatWithFood:
 
        这样写的话,那么调用方法的时候看起来就像是1条完整的语句. 提高了我们代码的阅读性.
 
        遵守的规范: 就是让我们的方法调用的时候看起来像1条完整的语句.
 
 
 
    2).如果方法有多个参数 建议这个方法名称:
 
       方法名With:(参数类型)参数名称 and:(参数类型)参数名称 and:(参数类型)参数名称;
       - (int)sumWith:(int)num1 and:(int)num2;
 
 
        sumWith: and:
 
 
      更详细的写法
      方法名With参数1:(参数类型)参数名称 and参数2:(参数类型)参数名称 and参数3:(参数类型)参数名称;
 
 
 
 
 
 
 */
#import <Foundation/Foundation.h>


@interface Person : NSObject
{
    NSString *_name;
    int _age;
}

- (void)run;

- (void)eat:(NSString *)foodName;


- (void)eatWith:(NSString *)foodName;

- (void)eatWithFood:(NSString *)foodName;


- (int)sum:(int)num1 :(int)num2;

- (int)sumWith:(int)num1 and:(int)num2;

- (int)sumWithNum1:(int)num1 andNum2:(int)num2;


@end


@implementation Person
- (void)run
{
    NSLog(@"我是人,我在piapia的跑....");
}
- (void)eat:(NSString *)foodName
{
    
    NSLog(@"主人.你给我的%@真好吃.",foodName);
}

- (void)eatWith:(NSString *)foodName
{
     NSLog(@"主人.你给我的%@真好吃.",foodName);
}

- (void)eatWithFood:(NSString *)foodName
{
    NSLog(@"主人.你给我的%@真好吃.",foodName);
}
- (int)sum:(int)num1 :(int)num2
{
    int num3 = num1 + num2;
    return num3;
}
- (int)sumWith:(int)num1 and:(int)num2
{
    int num3 = num1 + num2;
    return num3;
}

- (int)sumWithNum1:(int)num1 andNum2:(int)num2
{
    int num3 = num1 + num2;
    return num3;
}


@end


int main(int argc, const char * argv[])
{
   
    Person *p1 = [Person new];
    
    [p1 eat:@"红烧肉"];
    [p1 eatWith:@"红烧土豆"];
    [p1 eatWithFood:@"红烧狮子头"];
    
    int sum =  [p1 sum:10 :20];
    sum =   [p1 sumWith:10 and:20];
    [p1 sumWithNum1:10 andNum2:20];
    
    
    
    
    
//    [p1 eatWith:@"红烧肉"];
//    
//    
////    [p1 run];
////    [p1 eat:@"红烧排骨"];
////    
////    int sum =  [p1 sum:10 :20];
////    NSLog(@"sum = %d",sum);
////    
    
    
    return 0;
}






























