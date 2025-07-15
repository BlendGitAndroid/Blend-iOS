/*
  1. OC在C的基础之上新增了一些数据类型.
 
     BOOL
     Boolean
     class
     nil
     SEL
     id
     block
 
 
  2. block是1个数据类型.
     int double float char .......
     既然是1个数据类型,那么就可以声明这个数据类型的变量. 所以我们完全也可以声明1个block类型的变量.
     不同类型的变量中可以存储不同类型的数据.
     那么block类型的变量中可以存储什么样的数据呢?
 
     1). block是1个数据类型 所以我们可以声明1个block类型的变量.
 
     2). block类型的变量中专门存储1段代码. 这段代码可以有参数 可以有返回值.
 
 
  3. block变量的声明
     
 
     1). 虽然block变量中是用来存储1段代码的.但是1个block变量中并不是任意的1段代码都可以存进去的
         而是有限定的.
 
         也就是说.在声明block变量的时候.必须要指定这个block变量存储的代码段是否有参数.是否有返回值.
         一旦指定以后,这个block变量中就只能存储这样的代码了.
 
         声明了1个block变量.返回值是void 参数是1个int类型的.
         这个时候. 这个block变量中就只能存储无返回值并且有1个int参数的代码段.
 
 
     2). 声明block变量的语法格式:
         
         返回值类型 (^block变量的名称)(参数列表);
 
         void (^myBlock1)(); 表示声明了1个block类型的变量叫做myBlock1 这个变量中只能存储没有返回值没有参数的代码段.
 
         int (^myBlock2)(); 
 
         int (^myBlock3)(int num1,int num2);
 
         这个bolck有点像接口回调，
 
     3). 最重要的
         声明block变量的时候要指定这个block变量可以存储的代码段的返回值和参数描述.
         一旦指定.这个block变量中就只能存储这样的代码段了. 其他格式的代码段无法存储.
 
    这个^就是为了标识block的
 
 
  4. 初始化block变量
     1). 原理: 写1个符合block要求的代码段.存储到block变量中就可以了.
 
    
     2). 代码段的书写格式:
 
         ^返回值类型(参数列表){
            代码段;
         };
 
     3). 写1个无参数无返回值的代码段.
 
         ^void(){
            NSLog(@"我爱你");
            NSLog(@"我恨你");
         };
 
         这个时候,我们就可以将这段代码使用赋值符号存储到 无返回值无参数要求的block变量中.
         void (^myBlock1)();
         myBlock1 =  ^void(){
             NSLog(@"我爱你");
             NSLog(@"我恨你");
         };
         当然也可以在声明block变量的同时使用符合要求的代码段初始化.
    
         void (^myBlock1)() =  ^void(){
             NSLog(@"我爱你");
             NSLog(@"我恨你");
         };
         
     4). 有返回值的代码段.
    
         ^int(){
            int num1 = 10 + 20;
            return num1;
         };
        
         我们就可以将这段代码赋值给符合要求的block变量.
         int (^myBlock2)() =  ^int(){
             int num1 = 10 + 20;
             return num1;
         };
 
 
     5). 既有参数也有返回值的代码段.
 
         ^int(int num1,int num2){
            int num3= num1 + num2;
            return num3;
         };
        
         所以 我们可以将这个代码赋值给符合要求的block变量.
 
         int (^myBlock3)(int num1,int num2) =  ^int(int num1,int num2){
             int num3= num1 + num2;
             return num3;
         };
 
 
 
     6). 注意.
 
         赋值给block变量的代码段必须要符合block变量的要求. 否则就会报错.
 
 
  5. 如何执行存储在block变量中的代码段.
 
 
     语法格式: block变量名();
     
     有参数就传参数.有返回值就接.
 
 
  6. 关于block的简写.
 
     1). 如果我们写的代码段没有返回值.那么代码段的void可以省略.
         void (^myBlock1)() =  ^(){
             NSLog(@"我爱你");
             NSLog(@"我恨你");
         };
         注意,我说的是代码段的返回值如果是void可以省略,声明block变量的返回值无论是什么不可以省略.
         
 
     2). 如果我们写的代码段没有参数,那么代码段的小括弧写可以省略.
 
         int (^myBlock2)() =  ^int{
             int num1 = 10 + 20;
             return num1;
         };
         再次强调: 我们说的是代码段.
 
         所以,当1个代码段既没有参数,也没有返回值的适合,就只写^
 
         void (^myBlock1)() =  ^{
             NSLog(@"我爱你");
             NSLog(@"我恨你");
         };
         
 
     3).声明block变量的时候.如果有指定参数.可以只写参数的类型而不写参数的名称;
 
     int (^myBlock3)(int,int) =  ^int(int num1,int num2){
         int num3= num1 + num2;
         return num3;
     };
     注意: 这个地方我们说的是声明block变量的时候 再写代码段的时候 类型和名称都要写.
 
 
     4).无论代码段是否有返回值.在写代码的时候.可以不写返回值类型 省略.
        如果在写代码段的时候,省略了返回值,这个时候系统会自动的确定返回值的类型.
 
        如果代码段中没有返回任何数据 那么它会认为这个代码段是没有返回值的.
        如果代码中有返回数据 返回的数据是什么类型 它就会认为这个代码段是什么类型的.
 
 
    建议: 仍然按照我们最标准的写法来写block变量和block代码段.因为这样可以提高代码的阅读性.
 
 
 
  7. 简化block变量的复杂定义.
 
     1). 问题: 定义block变量的时候.要写好大1串啊! 类型好长.
 
     2). typedef的使用场景: 将1个长类型定义为1个短类型.
 
     3). 我们也可以使用typedef将长的block类型 定义为1个短类型.
 
         typedef 返回值类型 (^新类型)(参数列表);
    
         typedef void (^NewType)(); 代表重新定义了1个类型叫做NewType 是1个block类型 无参数无返回值的block类型
 
 
  8. 关于block块访问外部变量的问题.
 
 
     1). 在block代码块的内部可以取定义在外部的变量的值, 定义在外部的局部变量和全局变量.
 
     2). 在block代码块的内部可以修改全局变量的值.但是不能修改定义在外部的局部变量的值.
 
     3). 如果你希望我们定义的局部变量可以允许在block代码的内部去修改,那么就为这个局部变量加1个__block的修饰符.
 
 -------总结-------
 1.  block是1个数据类型.
 2.  block变量是来存储1段代码的.
 3.  block变量的声明.
 4.  block变量的初始化
 5.  执行存储在block变量中的代码.
 6.  关于4个简写.
 7.  使用typedef将复杂的block定义简化.
 8.  访问外部变量的问题.
 
 只有声明的时候，block这个类型才需要定义类型名称，实现的时候不需要定义了
 
 */

#import <Foundation/Foundation.h>
typedef void (^NewType)();  // 这个是typedef 定义的类型



int num1 = 100;// 全局变量.

int main(int argc, const char * argv[])
{
  
    __block int num2 = 200;//局部变量.并且这个局部变量在block中修改了，所以得加上__下划线
    
    NewType block1 = ^{
    
        int num3 = 300;//局部变量.
        
        num2++;
        
        
        
        NSLog(@"num2= %d",num2);
        
        NSLog(@"啦啦啦,我是小行家");
        
    };
    
    block1();
    
    
    
    
    
//    typedef void (^NewType)();
//    //代表重新定义了1个类型叫做NewType
//    NewType block1 = ^{
//        NSLog(@"呵呵");
//    };
//    NewType block2;
//    
//    
//    typedef int (^NewType2)(int num1,int num2);
//    NewType2 t1 = ^int(int num1,int num2){
//        
//        int num3 = num1 + num2;
//        return num3;
//    };
    
    
    
    
    
    //int
    
//    NSUInteger i = 10;
//    unsigned long i1 = 100;
//    
//    typedef unsigned long long int itcast;
//    typedef int ChinaILoveYou;
//    
//    itcast i1 = 10;
    
    
   
    
    
//    
//    void (^myBlock1)();
//    void (^myBlock2)();
//    void (^myBlock3)();
//    
//    int (^myBlock4)(int num1,int num2);
    
    
    
    
    
//    void (^myBlock1)() =  ^{
//        NSLog(@"我爱你");
//        NSLog(@"我恨你");
//    };
//    
//    
//    
//    int (^myBlock3)(int,int) =  ^(int num1,int num2){
//        int num3= num1 + num2;
//        return num3;
//    };
//    
//    int sum =  myBlock3(10,20);
//    NSLog(@"sum = %d",sum);
    
    
    
//    int (^myBlock2)() =  ^int{
//        int num1 = 10 + 20;
//        return num1;
//    };
//    
    
    
    /*
    void (^myBlock1)() =  ^void(){
        NSLog(@"我爱你");
        NSLog(@"我恨你");
    };
    
    
    myBlock1();
    
    
    int (^myBlock2)() =  ^int(){
        int num1 = 10 + 20;
        return num1;
    };
    
    int sum =  myBlock2();
    NSLog(@"sum = %d",sum);
    
    
    
    int (^myBlock3)(int num1,int num2) =  ^int(int num1,int num2){
        int num3= num1 + num2;
        return num3;
    };
    
    
    int res = myBlock3(10,100);
    NSLog(@"res = %d",res);
    */
    
    
  
    
    
    
   
    
  
    
    
    return 0;
}
