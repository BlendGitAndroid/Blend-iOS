/*
  1. 请问是先有类还是先有对象?
 
     从现实的角度 一定是先有对象再有类.
     从代码的角度 一定是先有类再游对象.
 
 
  2. 再一次确认类的作用: 描述1群具有相同特征和行为的事物的.
 
 
  3. 如何定义类.
 
     1).类的三要素.
 
 
     2).定义类的语法
 
        a. 位置. 直接写在源文件之中 不要写在main函数之中.
 
        b. 类的定义分为两个部分.
           -> 类的声明
 
           @inteface 类名 : NSObject
           {
                这类事物具有的共同的特征.将他们定义为变量.
           }
           功能就是1个方法.将方法的声明写在这里.
           @end
           -> 类的实现
 
           @implementation 类名
           将方法的实现写在这里.
           @end
 
 
 
      3).几点注意
 
         a. 类必须要有声明和实现
         b. 类名用你描述的事物的名称来命名就可以了.
            类名的每1个单词的首字母必须要以大写开头.
 
         c. NSObject是神马意思 不用惯 照写就可以了 。
         d. 用来表示着类事物的共同的特征的变量必须要定义在@interface的大括弧之中.
         e. 定义在大括弧之中用来表示着类事物的共同的特征的变量我们叫做.
            属性 成员变量 实例变量 字段.......
 
         f. 为类定义属性的时候,属性的名词必须要以_开头 下划线开头.
 
 
        语法是固定的.
 
         @interface 类名 : NSObect
         {
             这类事物具有的共同的特征定义为变量.
             数据类型 变量名1;
             数据类型 变量名2;
             .........
         }
 
         @end
 
 
         @implementation 类名
 
         @end
 
 4. 类的定义.
 
    1). 类的作用.
 
    2). 类的三要素.
 
    3). 类的定义.
 
 
 
 
 5. 类是无法直接使用的. 如果非要使用这个类的话,就必须要先找到这个类中的1个具体存在.
    再使用这个对象
 
 
    类和对象的关系: 类中有的东西 这个类的对象也有 不会多少也不会少. 对象就可以使用.
    这个时候我们就可以使用对象里面东西..
 
 
    如何创建1个类的对象呢?
 
    语法:  类名 *对象名 = [类名 new];
 
          Person *p1 = [Person new];
 
          根据Person这个类的模板,创建了1个对象名字叫做p1.
          p1对象的特点:
          -> 可以直接使用.
          -> 类中定义的东西 这个对象中也有 不会多也不会少.
 
 
 
 
 6. 如何使用对象;
 
 
    如何访问对象的属性:
 
    1). 默认情况下,对象的属性是不允许被外界直接访问的.
 
        如果允许对象的属性可以被外界访问,那么就再声明属性的是加1个@public关键字.
 
 
    2). 访问对象的属性的方式
 
        对象名->属性名 = 值;
        对象名->属性名;
 
 
        (*对象名).属性名;
 
        平时使用的时候,使用->
 
 
 7. 课堂练习:
 
    写1个学生类. 属性: 姓名 年龄 语文成绩 数学成绩 英语成绩
 
 
 
 
 
 
 
 
 
 
 
 */
#import <Foundation/Foundation.h>





@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
    float _height;

}

@end



@implementation Person

@end





@interface Student : NSObject
{
     @public
    NSString *_name;
    int _age;
    int _yuWen;
    int _shuXue;
    int _yingYu;
}
@end


@implementation Student


@end





int main(int argc, const char * argv[])
{
    Student *s1 = [Student new];
    Student *s2 = [Student new];
    Student *s3 = [Student new];
    // 可是使用 -> 快捷键
    s1->_name = @"小花";
    s1->_age = 17;
    s1->_shuXue = 100;
    s1->_yingYu = 99;
    s1->_yuWen = 98;
    
    s2->_name = @"小牛";
    s2->_shuXue = 18;
    s2->_yingYu = 30;
    
    
    NSLog(@"s1对象的姓名是%@,年龄是%d 语文是%d 数学是%d 英语是%d",
          s1->_name,
          s1->_age,
          s1->_yuWen,
          s1->_shuXue,
          s1->_yingYu
          );
    
    NSLog(@"s2对象的姓名是%@，年来%@", s2->_age, s2->_name);
    
    
//    
    
    
    

  
//    Person *p1 = [Person new];
//    
//    (*p1)._name = @"jack";
//    (*p1)._age = 18;
//    (*p1)._height= 189.f;
//    
    
   
    
//    p1->_name =  @"jack";
//    p1->_age = 19;
//    p1->_height = 178.5f;
//    
//    
//    NSLog(@"p1对象的_name属性的值是%@",p1->_name);
    
    
    
    
    
    return 0;
}
