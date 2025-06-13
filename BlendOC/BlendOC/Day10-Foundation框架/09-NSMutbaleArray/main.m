/*
  1. NSMutableArray是NSArray的子类.
 
     1). NSMutableArray仍然是1个数组.具备NSArray数组的特点.
         只能存储OC对象.每1个元素的紧密相连的.
 
     2). NSMutableArray相对于父类做的扩展:NSMutableArray数组的元素可以动态的新增和删掉.
         其他的用法均与NSArray一致.
 
         所以: NSArray数组一旦创建,其元素的个数就固定,无法新增删除.
              NSMutableArray数组.元素可以新增 可以删除. 其他用法和父类一样.
 
 
 
  2.NSMutableArray数组的创建.
 
     NSMutableArray *arr1 = [NSMutableArray new];
     NSMutableArray *arr2 = [[NSMutableArray alloc] init];
     NSMutableArray *arr3 = [NSMutableArray array];
 
     这样创建出来的数组对象.数组的元素是0 仍然是有意义的 因为我们可以动态的新增和删除元素.
 
 
 
     也可以使用这样的方式来创建可变数组对象.这个数组的元素可以新增和删除.
     NSMutableArray *arr4 = [NSMutableArray arrayWithObjects:@"jack",@"rose",@"lili", nil];
 
 
     最容易犯错:这样写是不可以的
     NSMutableArray *arr5 = @[@"jack",@"rose",@"lili"];
 
     @[@"jack",@"rose",@"lili"];这是1个NSArray对象.
     arr5是1个子类指针. 子类指针指向父类对象的就有可能会出问题.

 
 ---------插入---------
 
 1. 任意的指针其实可以指向任意的对象.  编译不会报错 只会给1个警告.
 
 2. 虽然语法上可以乱指.但是你千万别乱指.因为运行的适合可能出错.
 
    当我们调用指针类型特有的方法的时候.
 
 -------------------------
 
 
 3.  如何往可变数组中新增元素.
 
     - (void)addObject:(ObjectType)anObject; 将传入的参数作为数组的元素添加进去.
 
 
 4.  将另外1个数组中的每1个元素添加到可变数组中.
 
     - (void)addObjectsFromArray:(NSArray<ObjectType> *)otherArray;
 
 
 5. 在可变数组中指定的下标出插入1个元素.
 
    - (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
 
 
 --------------
 
 6. 删除可变数组中指定下标的元素.
 
    - (void)removeObjectAtIndex:(NSUInteger)index;
 
 7. 删除可变数组中所有的指定的元素.
 
    - (void)removeObject:(ObjectType)anObject;
 
 8. 删除指定范围中的所有指定元素.
 
    - (void)removeObject:(ObjectType)anObject inRange:(NSRange)range;
 
 9. 删除最后1个元素
     
    - (void)removeLastObject;
 
 10.删除所有的元素.
 
    - (void)removeAllObjects;
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"jack",@"rose",@"lili",@"lili",nil];
    
    //[arr removeObject:@"lili"];
    //[arr removeObject:@"lili" inRange:NSMakeRange(0, 3)];
    
   // [arr removeObjectAtIndex:arr.count-1];
    
    [arr removeAllObjects];
    
    
    NSLog(@"%@",arr);
    
    
    
    
//    [arr insertObject:@"lilei" atIndex:1];
//    
//    
//    NSLog(@"%@",arr);
//    
//    
//    [arr removeObjectAtIndex:1];
//    
//    
//     NSLog(@"%@",arr);
    
    

//    NSMutableArray *arr1 = [NSMutableArray new];
//    NSLog(@"arr1.Count = %lu",arr1.count);
//    
//    [arr1 addObject:@"jack"];
//
//    
//    
//     NSArray *arr = @[@"rose",@"lili",@"lucy",@"poly"];
//    //[arr1 addObject:arr];//将传入的数据作为可变数组的1个元素.
//    [arr1 addObjectsFromArray:arr];
//    
//    
//    
//    NSLog(@"arr1.Count = %lu",arr1.count);
//    
//    
//    
//    NSLog(@"%@",arr1);
    
    
    
    
//    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
//    NSMutableArray *arr3 = [NSMutableArray array];
//    
//    
//    NSMutableArray *arr4 = [NSMutableArray arrayWithObjects:@"jack",@"rose",@"lili", nil];
//    
//    NSMutableArray *arr5 = @[@"jack",@"rose",@"lili"];
    
    
    //[arr5 addObject:@"12"];
    
    
    
//    
//    NSString *str = [Person new];
//    [str length];
//    
//    
    
    
    
    
    return 0;
}
