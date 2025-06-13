/*
  1. 字符串的截取.
     取到字符串中的1部分.
 
 
     - (NSString *)substringFromIndex:(NSUInteger)from; 从指定的下标出一直截取到最后.
     - (NSString *)substringToIndex:(NSUInteger)to; 从第0个开始截取指定的个数.
     - (NSString *)substringWithRange:(NSRange)range; 截取指定的1段范围.
 
 
  2. 字符串的替换
 
     - (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
 
     将字符串中第1个参数替换为第2个参数.友情提示: 原来的指针指向字符串的内容是不会变的  会全部替换.
     新串是以方法的返回值返回的.
 
     这个方法还可以做删除. 原理: 将其替换为@""
 
 
  3. 字符串数据转换为其他的类型. 使用频率很高.
 
     @property (readonly) double doubleValue;
     @property (readonly) float floatValue;
     @property (readonly) int intValue;
     @property (readonly) NSInteger integerValue
     @property (readonly) long long longLongValue
     @property (readonly) BOOL boolValue
 
 
     转换注意. 从头开始转换,能转换多少就是多少. 到遇到不能转换的时候就停止转换.
 
 
  4. 去掉字符串前后的空格.
     str =  [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
     中间的空格无法去掉.
 
 
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    
    
    
    
    
    
//    NSString *str = @"LOVE";
//    str =   [str lowercaseString];
//    NSLog(@"%@",str);
    
    
    
//    NSString *str = @"         dni2wnd       iw2ndi2nd      ";
//    NSLog(@"%@",str);
//    str =  [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    
//    NSLog(@"%@",str);
//    NSString *str = @"110";
//    int num =  str.intValue;
//    NSLog(@"num = %d",num);
    
//    NSString *str = @"12.12aaaaa";
//    double num = str.floatValue;
//    NSLog(@"%lf",num+1);
    
    
    
    
    
    
    
//    NSString *str = @"中国\n我爱你\n啊真的\n爱\n你啊!";
//    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    
//    NSLog(@"%@",str);
    
//    NSString *email = @"wxw@itcast.cn";
//    email =[email stringByReplacingOccurrencesOfString:@"@" withString:@"#"];
//
//    NSLog(@"%@",email);
//    NSString *str = @"我北京爱北京天安门!";
//    
//    str =  [str stringByReplacingOccurrencesOfString:@"北京" withString:@"广州"];
//    
//    NSLog(@"%@",str);
    
    
    
    
    
  
//    
//    NSString *newStr =  [str substringWithRange:NSMakeRange(2, 3)];
//    
//    NSLog(@"%@",newStr);
//    
    
    
    
    
    return 0;
}
