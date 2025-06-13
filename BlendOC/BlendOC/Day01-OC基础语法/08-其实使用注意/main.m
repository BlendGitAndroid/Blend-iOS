/*
  1. 同1个类可以创建无数个对象.
 
 
  2. 同1个类的多个对象之间毫无关系.
     虽然他们拥有相同的属性和方法.
 
     属性的值是不会相互影响的
 
 
  3. 在方法的实现中,可以直接访问属性.
 
     在方法中访问的属性是谁的属性呢?
 
     这个方法是通过那1个对象来调用的.那么方法中的直接访问的属性就是那1个对象的.
 
 
  4. 案例.
 
     定义1个类,叫做Student 
 
     属性: 体重.
 
     方法: 跑步: 每跑1次 这个学生对象的体重-0.5;
          吃饭: 每吃1次饭 这个学生对象的体重 +0.7
 
 
 
 
 
 
 */
#import <Foundation/Foundation.h>



@interface Student : NSObject
{
    @public
    NSString *_name;
    float _weight;
}

- (void)run;
- (void)eat;

@end


@implementation Student
- (void)run
{
    NSLog(@"我piapia的跑...我体重就轻了");
    _weight -= 0.5f;
    NSLog(@"跑完了我的体重是%.2f",_weight);
    
}
- (void)eat
{
    NSLog(@"我是吃货,我骄傲....");
    _weight += 0.7f;
    NSLog(@"哎,我的体重是%.2f",_weight);
}
@end




@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
}

- (void)sayHi;

@end


@implementation Person

- (void)sayHi
{

    NSLog(@"大家好,我叫%@，我今年有%d岁.!!",_name,_age);
}

@end


int main(int argc, const char * argv[])
{
    
    Student *s1 = [Student new];
    s1->_name = @"小星星";
    s1->_weight = 60.4f;
    
    
    [s1 run];
    [s1 run];
    [s1 eat];
    [s1 eat];
    [s1 run];
    
    
    
    
  
//    Person *p1 = [Person new];
//    p1->_name = @"jack";
//    p1->_age = 18;
//    
//    [p1 sayHi];
//    
//    
//    
//    Person *p2 = [Person new];
//    p2->_name  = @"肉丝";
//    p2->_age = 17;
//    
//    [p2 sayHi];
    
    
    //NSLog(@"p2->_name = %@",p2->_name);
    
    
    
    
    
    
    return 0;
}


























