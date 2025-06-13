/*
 
 * 账号名称
 * 账号密码
 * 账号注册时间 年月日. int year int month int day
 
 
 
 ----结构体和类的区别-----
 
 1. 结构体只能封装属性,而类不仅可以封装属性还可以封装方法.
 
    如果1个封装数据既有属性也有行为,只能用类.
 
 
 2. 结构体变量分配在栈.OC对象分配在堆.
    栈的空间相对较小.但是存储在栈中的数据访问效率相对较高.
    堆的空间相对较大.但是存储在堆中的数据的访问效率相对较低.
 
    如果1个封装数据只有属性.如果用结构体就会分配在栈 效率就会高.
                        如果使用类型 对象就分配在堆 效率相对就会低.
 
    如果定义1个结构体,这个结构体中有很多个属性.那么这个时候结构体变量在栈中就会占据很大1块空间 反而会降低效率.
 
    什么时候使用结构体: 1). 封装数据只有属性 2) 属性较少. 3个以下.
    什么时候使用类: 1).封装数据既有属性也有行为. 2).只有属性 但是属性较多.
 
 
 3. 结构体赋值是 直接赋值的值. 而对象的指针 赋值的是对象的地址.
 
 
 */
#import <Foundation/Foundation.h>


typedef struct
{
    int year;
    int month;
    int day;
} CZDate;




/**
 *  账户类
 */
@interface Account : NSObject

/**
 *  账户名称
 */
@property(nonatomic,retain)NSString *userName;


/**
 *  账户密码
 */
@property(nonatomic,retain)NSString *password;


/**
 *  账户注册日期.
 */
@property(nonatomic,assign)CZDate registDate;






@end
