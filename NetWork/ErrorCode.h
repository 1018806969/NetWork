//
//  ErrorCode.h
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestFailCode)
{
    RequestFailCode_NoNetwork = NSURLErrorNotConnectedToInternet,
    RequestFailCode_TimeOut = NSURLErrorTimedOut,
    RequestFailCode_3840Failed = 3840,
    RequestFailCode_404Failed = NSURLErrorBadServerResponse,
    RequestFailCode_UnURL = NSURLErrorUnsupportedURL,
};

@interface ErrorCode : NSObject

+(NSString *)showErrorMsg:(NSDictionary *)response;


+(NSString *)handleError:(RequestFailCode)errorCode;




@end
