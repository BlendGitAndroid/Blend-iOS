/*
 在ARC机制下.当两个对象相互引用的时候.如果两边都使用strong 那么就会先内存泄露.
    
 解决方案: 1端使用strong 1端使用weak
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
   if(1)
   {
    
    Person *p1 = [Person new];
    
    Book *b1 = [Book new];

    p1.book = b1;
    
    b1.owner = p1;
   }
    
    
    
    
    return 0;
}
