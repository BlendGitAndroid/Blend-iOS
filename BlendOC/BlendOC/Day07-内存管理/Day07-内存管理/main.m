/*
  1. Xcode4.4之前
     @property: 只生成getter、setter方法的声明.
     @synthesize: 生成私有属性.并生成getter、setter方法的实现.
 
 
     Xcode4.4开始.
     @property增强: 
     1). 自动生成私有属性.
     2). 自动生成私有属性的getter setter方法的声明和实现.
 
 
  2. 编译检查与运行检查
 
     编译检查: 
     通过1个指针去访问对象的成员的时候,编译判断可以不可以的准则: 指针的类型当中是否有这个成员.
     运行检查:
     在程序运行的时候,通过1个指针去访问对象的成员之前,还会检查指针所指向的对象中是否真的有这个成员.
 
  
  3. 万能指针(NSObject、id). instancetype
 
     NSObject和id 它们都是万能指针,可以指向任意的OC对象.
     NSObject指针访问对象的成员的时候,编译器会做编译检查.
     id指针调用指针指向的对象的方法的时候.编译器不做任何检查 直接通过.
 
     id指针的缺点: 不能使用->访问属性 也不能使用点语法.
 
     instancetype: 只能做为方法的返回值.代表返回当前类的对象.
 
 
  4. 动态类型检测 反射
 
     1). 判断指针指向的对象中 指定的方法是是否可以调用.
 
     2). 判断类方法是否可以调用.
 
     3). 判断对象是否为指定类的对象或者子类对象.
 
     4). 判断对象是否为指定类的对象.
 
     5). 判断指定的类是否为另外1个类的子类.
 
  5. 构造方法.
     1). new是1个类方法. 创建对象初始化对象返回对象.
     2). new方法的内部其实就是 alloc init
     3). init方法就叫做构造方法. 初始化对象
     4). 重写init构造方法.     
     5). 自定义构造方法.
         
 
    如果你想要调用init默认的构造方法.那么new可以. 也可以使用alloc init
    如果你像要调用自定义的构造方法.这个时候就必须先alloc 再调用自定义的init
 
 
  
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p1 = [Person new];//alloc init
    
    Person *p2 = [[Person alloc] initWithName:@"小乔" andAge:18];
    
    
//    BOOL res =  [NSMutableString isSubclassOfClass:[NSString class]];
//     NSLog(@"res = %d",res);
//    NSMutableString *str = [NSMutableString new];
//    //str对象是不是1个NSString对象或者它的子类对象.
//    BOOL res =  [str isMemberOfClass:[NSString class]];
//    
//    NSLog(@"res = %d",res);
    
    
//    Person *p1 = @"jack";
//    [p1 setName:@"rose"];
//    
//    NSObject *obj = [Person new];
//    [(Person *)obj setName:@"11"];
//    
//    id id1 = [Person new];
//    [id1 setName:@"jack"];
//    
//    
//    
//    Person *p2 = [Person new];
//    
//    BOOL res =  [p2 respondsToSelector:@selector(setName:)];
//    
    

    
    
    
    return 0;
}
