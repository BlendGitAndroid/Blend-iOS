/*
 
   1. block是1个数据类型.能不能不能作为函数的参数呢? 当然是可以的.
 
 
   2. 如何为函数定义block类型的参数?
      a. 就是在小括弧中声明1个指定格式的block变量就可以了.
      b. 可以使用typedef简化定义,这样看起来就不会晕了.
 
 
   3. 如何调用带block参数的函数呢?
 
      a. 如果要调用的函数的参数是block类型的,那么要求在调用的时候传入1个和形参block要求的代码段.
 
      b. 调用的时候,可以先讲代码段存储到1个block变量中,然后再传递这个block变量
         也可以直接将符合要求的代码段写在小括弧中传递.
 
      c. 小技巧. 通过Xcode提示可以快速的生产block代码段的框架.
 
 
   4. 将block作为函数的参数可以实现什么样的效果?
 
      可以将调用者自己写的1段代码 传递到 函数的内部去执行.
 

.
 
   5. block也可以作为函数的返回值.
 
      当将block作为函数的返回值的时候,返回值的类型就必须要使用typedef定义的短类型.
 

  
   6. block与函数
 
      相同点: 都是封装1段代码.
 
      不同点:
      1). block是1个数据类型.函数是1个函数.
      2). 我们可以声明block类型的变量  函数就只是函数. 
      3). block可以作为函数的参数. 而函数不能直接作为函数的参数.
 
 
 
 
 */
#import <Foundation/Foundation.h>
typedef void (^NewType)();

//为这个函数定义1个参数.定义1个block类型的参数.
//无参数的无返回值的block
void test(NewType block1)
{
    NSLog(@"~~~~~~~~~~~~");
    block1();
    NSLog(@"~~~~~~~~~~~~");
}

void test2(int (^paramsBlock)(int num1,int num2))
{
    NSLog(@"~~~~~~~~~~~~");
    int sum = paramsBlock(10,20);
    NSLog(@"%d",sum);
    NSLog(@"~~~~~~~~~~~~");

}

void test1(int num)
{
    
}



NewType ttt()
{
    void (^block1)() = ^ {
        NSLog(@"~~~~~~");
        NSLog(@"~~~~~~");
        NSLog(@"~~~~~~");
    };
    return block1;
}


int main(int argc, const char * argv[])
{
    
   NewType type =  ttt();
   type();
    
    
//    
//    test(^{
//        NSLog(@"我爱广州小蛮腰!");
//        NSLog(@"北京天安门不爱");
//    });
    
    
    
//   test2(^int(int num1, int num2) {
//       return num1 + num2;
//   });
//    
//    
//    
    
    
    
    
//    NewType type = ^{
//        NSLog(@"哈哈");
//        NSLog(@"呵呵");
//        NSLog(@"嘿嘿");
//    };
    
//    test(^{
//        
//    });
    
//    test(^{
//        NSLog(@"哈哈");
//        NSLog(@"呵呵");
//        NSLog(@"嘿嘿");
//    });
//    
//    
//    test(^{
//        NSLog(@"哈哈");
//        NSLog(@"呵呵");
//        NSLog(@"嘿嘿");
//    });
//    
    
    

    
    
    
    
    return 0;
}
