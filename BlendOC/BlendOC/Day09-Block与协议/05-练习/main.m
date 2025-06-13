/*
  写1个类. 数组类.  给这个数组类提供1个方法 将1个国家字符串数组进行排序.
 
 
   什么时候block可以作为方法、函数的参数?
 
    当方法的内部需要执行1个功能.但是这个功能具体的实现函数的内部不确定.
    那么这个时候,就使用block让调用者将这功能的具体实现传递进来.
 

 
 
 
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "CZArray.h"


int main(int argc, const char * argv[])
{

    char *countries[] =
    {
        "Nepal",
        "Cambodia",
        "Afghanistan",
        "China",
        "Singapore",
        "Bangladesh",
        "India",
        "Maldives",
        "South Korea",
        "Bhutan",
        "Japan",
        "Sikkim",
        "Sri Lanka",
        "Burma",
        "North Korea",
        "Laos",
        "Malaysia",
        "Indonesia",
        "Turkey",
        "Mongolia",
        "Pakistan",
        "Philippines",
        "Vietnam",
        "Palestine"
    };
    
    CZArray *arr = [CZArray new];
    
    //[arr sortWithCountries:countries andLength:sizeof(countries)/8];
    
    [arr sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:^BOOL(char *country1, char *country2) {
        
        int res =  (int)strlen(country1) - (int)strlen(country2);
        if(res > 0)
        {
            return YES;
        }
        return NO;
        
    }];
    
    
    for(int i = 0; i < sizeof(countries)/8;i++)
    {
        NSLog(@"%s",countries[i]);
    }

    NSLog(@"---------");

    
    [arr sortWithCountries:countries andLength:sizeof(countries)/8 andCompareBlock:^BOOL(char *country1, char *country2) {
        int res =  strcmp(country1, country2);
        return res > 0;
    }];
    
    
//
//    
//    
//    
//    for(int i = 0; i < sizeof(countries)/8;i++)
//    {
//        NSLog(@"%s",countries[i]);
//    }
//    
    
    
    char arr1[3][10];
    

    
 
    
    
    
    
    return 0;
}
