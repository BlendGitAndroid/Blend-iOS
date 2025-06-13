/*
   1. 请声明1个指针.这个指针可以指向任意的对象,但是要求指向的对象要遵守指定的协议.
      如果不遵守 最起码要报1个警告.
 
      要求声明1个指针 指向1个遵守了学习协议的对象, 否则最起码要给哥哥1个警告.
 
      NSObject<协议名称> *指针名;
      这个时候,这个指针可以指向遵守了指定协议的任意对象. 否则就会报1个警告.
      NSObject<StudyProtocol> *obj = [Student new];
 
 
      当然了完全也可以使用id指针.
      id<协议名称> 指针名;
      id<StudyProtocol> id1 =  [Student new];
 
 
   2. 声明1个指针变量,要求这个指针变量指向的对象必须遵守多个协议.

      NSObject<StudyProtocol,SBProtocol> *obj1 = [Student new];
 
      id<StudyProtocol,SBProtocol> obj1 = [Student new];
 
 
   3. 定义1个指针,指向遵守了学习协议的学生对象.
 
 
   4. WHY?
 
      1). 遵守了某个协议的类,就相当于这个类拥有了这个协议所定义的行为.
 
      2). 因为我要调用这个对象中的协议方法.
          只有类遵守了协议,这个类中一定才会有协议方法.
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "StudyProtocol.h"
#import "ItCastStu.h"
#import "SBProtocol.h"

int main(int argc, const char * argv[])
{
    
    id<StudyProtocol> id1 = [Student new];
    [id1 study];
    
    //Student<StudyProtocol> *stu = [ItCastStu new];
    
    
    
   // NSObject<StudyProtocol,SBProtocol> *obj1 = [Student new];
    
    
//    NSObject<StudyProtocol> *obj = [Student new];
//    id<StudyProtocol> id1 =  [Student new];
//    
    
    
    
    return 0;
}
