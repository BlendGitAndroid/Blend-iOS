/*
  1. 开发程序分为ARC和MRC
 
  2. 与多线程相关的参数.
     atomic : 默认值 安全,但是效率低下.
     nonatomic: 不安全,但是效率高.
 
     无论在ARC还是在MRC都可以使用.
     使用建议: 无论是ARC还是MRC 都使用nonatomic
 
  3. retain: 
 
     只能用在MRC的模式下.代表生成的setter方法是标准的内存管理代码.
     当属性的类型是OC对象的时候.绝大多数情况下使用retain. 只有在出现了循环引用的时候1边retain 1边assign

 
  4. assign:
     在ARC和MRC的模式下都可以使用assign.
     当属性的类型是非OC对象的时候 使用assign.
 
 
  5. strong:
     只能使用在ARC机制下. 当属性的类型是OC对象类型的时候,绝大多数情况下使用strong]  
     只有出现了循环引用的时候, 1端strong 1端weak
 

  6. weak:
 
     只能使用在ARC机制下. 当属性的类型是OC对象的时候. 只有出现了循环引用的时候, 1端strong 1端weak
 
  7. readonly readwrite 
 
     无论是ARC还是MRC 都可以使用.
 
  8. setter getter 无论在ARC下还是在MRC下都可以改.
 
 
 -----------------------------
 在ARC机制下.原来使用retain的用strong
 出现循环引用的时候. MRC: 1边retain 1边assign  ARC: 1边strong 1边weak
 
 
 
 
 
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
