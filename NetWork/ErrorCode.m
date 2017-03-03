//
//  ErrorCode.m
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "ErrorCode.h"
#import "TipLabel.h"



@implementation ErrorCode
+(NSString *)showErrorMsg:(NSDictionary *)response
{
    NSString *errorCode = [response objectForKey:@"errorCode"];
    NSString *errorMsg = [response objectForKey:@"errorMessage"];
    NSString *tip = [NSString stringWithFormat:@"%@:%@",errorCode,errorMsg];
    [TipLabel show:tip];
    return tip;
}


+(NSString *)handleError:(RequestFailCode)errorCode
{
    NSString *errorMsg;
    switch (errorCode) {
        case RequestFailCode_NoNetwork:
            errorMsg = @"网络链接失败，请检查网络";
            
            break;
        case RequestFailCode_TimeOut :
            errorMsg = @"网络链接超时，请检查网络";
            break;
            
        case RequestFailCode_3840Failed :
            errorMsg = @"服务器错误，请稍后再试";
            
            break;
        case RequestFailCode_404Failed :
            errorMsg = @"错误:404";
            
            break;
        case RequestFailCode_UnURL :
            errorMsg = @"不支持的链接";
            
            break;
            
        default:
            break;
    }
    [TipLabel show:errorMsg];
    return errorMsg;
}

@end
