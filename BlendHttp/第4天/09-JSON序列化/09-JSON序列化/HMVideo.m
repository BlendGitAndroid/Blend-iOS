//
//  HMVideo.m
//  09-JSON序列化
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMVideo.h"

@implementation HMVideo{
    BOOL _isYellow;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@{videoName:%@,size:%d,author:%@,_isYellow:%d}",[super description],self.videoName,self.size,self.author,_isYellow];
}
@end
