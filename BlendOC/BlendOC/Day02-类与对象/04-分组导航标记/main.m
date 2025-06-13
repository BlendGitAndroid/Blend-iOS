/*
   分组导航标记:
 
 
   1). #pragma mark 分组名 
 
       就会在导航条对应的位置显示1个标题.
 
   2). #pragma mark -
 
       就会在导航条对应的位置显示1条水平分隔线.
 
   3). #pragma mark - 分组名
 
       就会在导航条对应的位置先产生1条水平分割线.再显示标题.
 
 
 
 
 */

#import <Foundation/Foundation.h>


#pragma mark - 人类
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

#pragma mark - 狗狗类
@interface Dog : NSObject

@end


@implementation Dog


@end


#pragma mark - 猫猫类的声明
@interface Cat : NSObject

@end

@implementation Cat


@end

#pragma mark - 鸟类的声明
@interface Bird : NSObject

@end

@implementation Bird


@end




int main(int argc, const char * argv[])
{
  
    
    
    
    
    
    return 0;
}
