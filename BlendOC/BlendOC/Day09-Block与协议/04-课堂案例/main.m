/*
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "CZArray.h"

int main(int argc, const char * argv[])
{

    CZArray *arr = [CZArray new];
    [arr bianli];
    
//    [arr bianLiWithBlock:^(int val) {
//        
//        NSLog(@"val = %d",val + 1);
//    }];
    
    
    void (^pBlock)(int val) = ^(int val){
        NSLog(@"val = %d",val + 1);
    };
    
    [arr bianLiWithBlock:pBlock];
    
    
    
    
    
    return 0;
}
