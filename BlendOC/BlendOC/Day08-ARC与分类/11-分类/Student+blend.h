//
//  Student+blend.h
//  BlendOC
//
//  Created by 徐海 on 2025/7/14.
//

#import "Student.h"

/**
 
 NS_ASSUME_NONNULL_BEGIN 是 Objective-C 在引入 Nullability Annotations（可空性标注） 后提供的一个宏，用于 批量声明对象默认是非空的（nonnull），从而减少代码中的 nonnull 重复标注。
 
 */
NS_ASSUME_NONNULL_BEGIN

@interface Student (blend)

@end

NS_ASSUME_NONNULL_END
