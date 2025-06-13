/*
  1. 集合
     NSArray集合、NSDictionary字典集合 就叫做集合.
 
 
  2. 在MRC的模式下 将1个对象存储到集合中,会不会影响对象的引用计数器.
 
     将对象存储到集合之中,会为这个对象的引用计数器+1
     当集合销毁的时候 就会像存储在集合中的所有的对象发送1条release消息.
 
    
  3. 使用@[]或者@{}创建的集合已经是被autorelease过的了.     
     直接调用和类同名的类方法创建的对象 也是被autorelease过的了.
 

  4. 在ARC的模式下.集合的元素是1个强类型的指针.
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [Person new];
    NSArray *arr = @[p1];
    
    
//    @autoreleasepool
//    {
//        NSArray *arr1 = [NSArray arrayWithObjects:@"jack",@"rose",@"lili",nil];
//        NSArray *arr2 = @[@"jack",@"rose"];
//        
//        
//    }
    

//    Person *p1 = [Person new];
//    
//    NSLog(@"%lu",p1.retainCount);
//    NSArray *arr = @[p1];
//    NSLog(@"%lu",p1.retainCount);
//    
//    
//    
//    [arr release];
//    NSLog(@"%lu",p1.retainCount);
//
//    [p1 release];
    return 0;
}
