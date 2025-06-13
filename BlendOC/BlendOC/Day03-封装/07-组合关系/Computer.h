/*
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "CPU.h"
#import "Memory.h"
#import "MainBoard.h"

/**
 *  计算机类
 */
@interface Computer : NSObject
{
    CPU *_cpu;
    Memory *_mem;
    MainBoard *_mb;
    
}

@end



