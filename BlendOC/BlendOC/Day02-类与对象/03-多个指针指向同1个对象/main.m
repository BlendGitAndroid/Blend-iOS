/*
  1. 同类型的指针变量之间是可以相互赋值的.
 
     Person *p1 = [Person new];
     Person *p2 = p1; 这是完全没有问题的. p1和p2的类型都是Person指针类型的.
 
     代表将p1的值赋值给p2 而p1的值是对象的地址 所以就把对象的地址赋值给了p2
 
     所以p1和p2指向了同1个对象.
 
     无论通过p1还是p2去修改对象,修改的都是同1个对象.
 
 
  2. 目前为止,只要你看到new 就说明新创建了1个对象.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>


@interface Person: NSObject
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
    NSLog(@"大家好,我叫%@，我今年%d岁",_name,_age);
}

@end

int main(int argc, const char * argv[])
{
    
    
    Person *p1 = [Person new];
    p1->_name = @"小明";
    p1->_age = 18;
    
    
    Person *p2 = p1;
    p2 = [Person new];
    p2->_name = @"小花";
    
    
    
    NSLog(@"p1->_name = %@",p1->_name);
    
    
    
    
    
    
    
    
    
    
    return 0;
}






















