/*
  1. 回忆C语言中的数组
     特点:
     a. 存储多个数据.
     b. 类型相同.
     c. 长度固定.
     d. 每1个元素都是紧密相连的.
 
  2. NSArray
     1). 是Foundation框架中的一个类.这个类的对象是来存储多个数据的,具备数组的功能.
         所以,NSArray是OC中的数组.
 
     2). 特点:
         a. 只能存储OC对象.任意的OC对象 无法存储
         b. 长度固定. 一旦NSArray数组创建完毕之后,元素的长度固定,无法新增 无法删除元素.
         c. 每1个元素都是紧密相连的. 每1个元素仍然有自己的下标.
         d. 元素的类型是id类型的.
 
 
  3. NSArray数组的创建.
 
     1). 因为这是1个类,所以当然就是创建NSArray对象.
 
         NSArray *arr1 = [NSArray new];
         NSArray *arr2 = [[NSArray alloc] init];
         NSArray *arr3 = [NSArray array];
 
         这样创建出来的NSArray数组的元素的个数是0个,因为长度固定.所以没有任何意义.
 
 
     2). 创建数组的同时指定1个数组的元素
 
         + (instancetype)arrayWithObject:(ObjectType)anObject;

         NSArray *arr = [NSArray arrayWithObject:@"jack"];
         仍然没有意义,因为这个数组中只有1个元素.
 
 
     3). 最常用的创建NSArray数组的方式.
 
         + (instancetype)arrayWithObjects:(ObjectType)firstObj, ...
 
         NSArray *arr = [NSArray arrayWithObjects:@"jack",@"rose",@"lili",@"hanmeimei",nil];
 
         使用注意
         1). 只能存储OC对象.不能存储非OC对象.
         2). 将元素写完以后,最后要写1个nil 表示元素到此结束了.
        
 
     4). 创建NSArray数组的简要方式.
 
         NSArray *arr = @[写上每1个元素的值用逗号分隔.];
         NSArray *arr = @[@"jack",@"rose",@"lili"];
         注意:  这种创建方式 不需要在最后加nil.
 
 
 
   4. NSArray数组的使用.
 
      1). 在NSLog函数中使用%@可以直接输出NSArray对象中的所有的元素的值.
 
      2). NSArray数组中不能存储基本数据类型.不能存储非OC对象.
          nil的本质其实就是0 所以nil无法存储到NSArray数组中.
 
      3). 这样创建数组没有任何意义.
             NSArray *arr1 = [NSArray new];
             NSArray *arr2 = [[NSArray alloc] init];
             NSArray *arr3 = [NSArray array];
          这些数组是没有元素的 而NSArray数组元素无法新增和删除,所以没有任何意义.
    
  5. 取出存储在NSArray数组中的元素的值.
 
     1). 可以使用下标取出对应的元素的值.
 
         NSArray *arr = @[@"jack",@"rose",@"lili"];
         
         NSLog(@"%@",arr[0]);
         NSLog(@"%@",arr[1]);
         NSLog(@"%@",arr[2]);
 
         如果下标越界 就直接运行报错.
 
 
     2). 调用数组对象的对象方法来取出指定下标的元素的值.
 
        - (ObjectType)objectAtIndex:(NSUInteger)index;
 
    
         NSArray *arr = @[@"jack",@"rose",@"lili"];
         NSString *str = [arr objectAtIndex:3];
         NSLog(@"%@",str);
         
 
 
  6. NSArray数组的其他的常用方法
 
     1). 得到NSArray数组中的元素的个数.
 
         @property (readonly) NSUInteger count;
 
     2). 判断NSArray数组中是否包含指定的元素.
 
         - (BOOL)containsObject:(ObjectType)anObject;
 
 
     3). 取到NSArray数组中的第1个元素.
         @property (nullable, nonatomic, readonly) ObjectType firstObject
 
         与arr[0]的区别.
         如果数组中没有任何元素.arr[0]报错. firstObject取到nil 不报错.
 
     4). 取到NSArray数组中的最后1个元素.
         @property (nullable, nonatomic, readonly) ObjectType lastObject
 
     5). 查找指定的元素在NSArray数组中第一次出现的下标.
         - (NSUInteger)indexOfObject:(ObjectType)anObject;
 
         如果没有找到 返回的是NSUInteger的最大值.
 
 
  7. NSArray数组的遍历.
 
     1). 使用for循环来遍历数组中的每1个元素.
 
         NSArray *arr = @[@"jack",@"rose",@"lili",@"jack",@"rose",@"lili"];
         
         for(int i = 0; i < arr.count; i++)
         {
             //NSLog(@"%@",arr[i]);
             NSLog(@"%@",[arr objectAtIndex:i]);
         }
 
         原理: 将下标挨个挨个遍历出来 取值.
 
 
     2). 使用增强for循环来遍历NSArray数组中的元素.
         
         a. 语法格式:
            for(元素类型 变量名 in 数组名)
            {
                直接通过变量名就可以拿到数组中的每1个元素.
            }
 
         b. 声明在for()中的变量叫做迭代变量.
 
         c. 执行的原理.  
 
            将数组中的第1个元素的值赋值给迭代变量.执行循环体.   
            将数组中的第2个元素的值赋值给迭代变量.执行循环体. 
            将数组中的第3个元素的值赋值给迭代变量.执行循环体.   
            .......
            将数组中的最后1个元素的值赋值给迭代变量.执行循环体.   
            结束循环.
 
 
         d. 语法总结:
            -> 迭代变量的类型和数组中的元素的类型保持一致.
            -> 迭代变量的名称可以任意取,根据自己的爱好.
            -> in是固定的.
            -> 遍历那1个数组,就降数组写在in后面.
            -> 循环体里面.迭代变量的值就是元素的值.
 
 
          当NSArray数组中存储的数据的类型不一致时候 迭代变量的类型建议使用id类型.
 
 
     3). 使用block遍历.
 
         - (void)enumerateObjectsUsingBlock:(void (^)(ObjectType obj, NSUInteger idx, BOOL *stop))block
 
         这是1个方法.这个方法的作用就是来遍历数组中的每1个元素.
 
 
 
 
  8. NSArray与字符串的两个方法
 
     1). 将数组中的元素连接起来组成1个新的字符串.
 
         - (NSString *)componentsJoinedByString:(NSString *)separator
 
         参数: 连接符.
 
 
     2). 将字符串以指定的分隔符分成1个数组. 每1部分就是数组的1个元素.      
         - (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator;
 
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSArray+itcast.h"

int main(int argc, const char * argv[])
{
    
//    NSString *str = @"北京,昌平区,传智播客,iOS基础班1010";
//    //使用,将字符串进行分隔
//    NSArray *arr =  [str componentsSeparatedByString:@","];
//    for(NSString *item in arr)
//    {
//        NSLog(@"%@",item);
//    }
//    
    
    NSString *str = @"jack";
    NSLog(@"%@",str);
    
    
  NSArray *arr = @[@"jack",@"rose",@"jim"];
    
    [arr objectAtIndex:1];
     NSLog(@"%@",arr);
//    
//    
//    NSString *str =  [arr componentsJoinedByString:@""];
//    NSLog(@"%@",str);
//    
    
    
    
    
    
    
    
    
    
//    [arr bianliWithBlock:^(id obj, int index, BOOL *stop) {
//        
//    }];
    
//    [arr bianliWithBlock:^(id obj, int index) {
//        NSLog(@"arr[%d] = %@",index,obj);
//    }];
    
    //这个方法做的事情:将arr数组中的每1个元素遍历出来.
    //当它将每1个元素遍历出来以后.诶.如何处理遍历出来的元素呢?
    //所以要求我们传递1段处理元素的代码过去.
//    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"%@.lenth = %lu",obj,[obj length]);
//        NSLog(@"idx = %lu",idx);
//        //如果想停止遍历,就讲stop指针指向的BOOL变量的值改为YES
//        if(idx == 1)
//        {
//            *stop = YES;
//        }
//    }];
//    
    
    
    
    
    
    
    
    
    
    
    
//    Person *p1 = [Person new];
//    Person *p2= [Person new];
//    Person *p3 = [Person new];
//    
//    NSArray *arr = @[p1,p2,p3,@"jack",@"rose",@"lili"];
//    
//    for(id item in arr)
//    {
//        NSLog(@"%@",item);
//    }
//    
//    
    
    
    
    
    
    
//    Person *p1 = [Person new];
//    Person *p2= [Person new];
//    Person *p3 = [Person new];
//    Person *p4 = [Person new];
//    Person *p5 = [Person new];
//    NSArray *arr = @[p1,p2,p3,p4,p5];
//    for(Person *per in arr)
//    {
//        NSLog(@"%@",per);
//    }
//    
    
    
//    NSArray *arr = @[@"jack",@"rose",@"lili"];
//    
//    for(NSString *str in arr)
//    {
//        NSLog(@"%@",str);
//    }
//    
//    
    
    
    
//    for(int i = 0; i < arr.count; i++)
//    {
//        //NSLog(@"%@",arr[i]);
//        NSLog(@"%@",[arr objectAtIndex:i]);
//    }
//    
    //NSLog(@"%@",arr);
    
    
    
    
//    NSUInteger index =  [arr indexOfObject:@"lili"];
//    if(index == NSNotFound)
//    {
//        NSLog(@"没有找到...");
//    }
//    else
//        NSLog(@"index = %lu",index);
//    
//    //@"rose"
//    
//    //arr[1];
//    NSLog(@"%@",arr.lastObject);
    
    
//    BOOL res = [arr containsObject:@"lilei"];
//    
//    NSLog(@"res = %d",res);
    
    //@"lili"
    
    
    
    //NSLog(@"arr.count = %lu",arr.count);
    
    
//    NSString *str = [arr objectAtIndex:3];
//    NSLog(@"%@",str);
    
//    NSLog(@"%@",arr[0]);
//    NSLog(@"%@",arr[1]);
//    NSLog(@"%@",arr[3]);

    
    
    
    
    
//    NSLog(@"%@",arr);
//    
//    Person *p1 = [Person new];
//    NSLog(@"%@",p1);
//    
    
    
    
    
    
 
    
    
    
    
    //NSLog(@"%lu",[str ap]);
    
    
    
    
    
    
    
//    NSArray *arr1 = [NSArray new];
//    NSArray *arr2 = [[NSArray alloc] init];
//    NSArray *arr3 = [NSArray array];
//     NSLog(@"%@",arr3);

    
//    NSArray *arr = [NSArray arrayWithObject:@"jack"];
//    
//    NSLog(@"%@",arr);
//    

    
//    NSArray *arr = [NSArray arrayWithObjects:@"jack",nil,@"rose",@"lili",nil];
//    
//    NSLog(@"%@",arr);

 
//    
//    Person *p1 = [Person new];
//    Person *p2= [Person new];
//    Person *p3= [Person new];
//    Person *p4 = [Person new];;
//    Person *p5 = [Person new];
//    Person *p6 = [Person new];
////
////    NSArray *arr = [NSArray arrayWithObjects:p1,p2,p3,p4,p5,p6, nil];
////    
////    NSLog(@"%@",arr);
////
//    
//    
//    NSArray *arr = @[@"jack",@"rose",@"lili"];//0
//    NSLog(@"%@",arr);
//    
//    NSArray *arr1 = @[p1,p2,p3,p4,p5,p6];
//     NSLog(@"%@",arr1);
//    
    return 0;
}
