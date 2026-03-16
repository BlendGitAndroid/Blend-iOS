//
//  HMAPIConfig.m
//  08-模拟科技头条
//
//  API配置实现文件
//

#import "HMAPIConfig.h"

@implementation HMAPIConfig

#pragma mark - URL配置

// 这段代码确实是 类方法的实现 ，用于支撑头文件中声明的 类属性 。
// @property(class) 只是语法糖，让调用方可以用点语法（ HMAPIConfig.baseURL
// ），但底层仍然是方法调用。 这是 Objective-C 类属性的标准实现方式。
+ (NSString *)baseURL {
    return @"https://dabenshi.cn";
}

+ (NSString *)hotNewsURL {
    return [NSString
        stringWithFormat:@"%@/other/api/hot.php?type=toutiaoHot", self.baseURL];
}

#pragma mark - 请求配置

+ (NSTimeInterval)requestTimeout {
    return 30.0f; // 30秒超时
}

#pragma mark - 错误处理

+ (NSError *)errorWithCode:(HMAPIErrorCode)code message:(NSString *)message {
    NSString *errorMessage = message ?: @"未知错误";

    // 字典，表示错误的详细信息，包括错误描述和失败原因
    NSDictionary *userInfo = @{
        NSLocalizedDescriptionKey : errorMessage,
        NSLocalizedFailureReasonErrorKey : [self errorReasonForCode:code]
    };

    // 这行代码创建了一个标准的 NSError 对象，用于统一封装 API
    // 请求过程中产生的各种错误，方便上层调用者识别和处理。
    return [NSError errorWithDomain:@"HMAPIErrorDomain"
                               code:code
                           userInfo:userInfo];
}

+ (NSString *)errorReasonForCode:(HMAPIErrorCode)code {
    switch (code) {
    case HMAPIErrorCodeNetworkFailure:
        return @"网络连接失败，请检查网络设置";
    case HMAPIErrorCodeServerError:
        return @"服务器错误，请稍后重试";
    case HMAPIErrorCodeDataParseError:
        return @"数据解析失败，数据格式可能有误";
    case HMAPIErrorCodeInvalidResponse:
        return @"服务器响应无效";
    default:
        return @"未知错误";
    }
}

@end
