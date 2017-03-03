//
//  TXBasicNet.m
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "TXBasicNet.h"
#import "AFNetworking.h"
#import "ErrorCode.h"

@implementation TXBasicNet

static AFHTTPSessionManager *manager;


-(void)post:(NSString *)url param:(NSDictionary *)param scc:(result)scc fail:(result)fail
{
    [manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----%@--%@--%@",url,param,responseObject);
        NSString *status = [responseObject objectForKey:@"status"];
        if ([status isEqualToString:@"OK"]) {
            NSDictionary *result = [responseObject objectForKey:@"results"];
            scc(result);
        }else
        {
            NSString *tip = [ErrorCode showErrorMsg:responseObject];
            if (fail) {
                fail(tip);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----%@--%@--%@",url,param,error);
        
        NSString *tip = [ErrorCode handleError:error.code];
        if (fail) {
            fail(tip);
        }
    }];
}


-(void)get:(NSString *)url param:(NSDictionary *)param scc:(result)scc fail:(result)fail
{
    [manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"----%@--%@--%@",url,param,responseObject);
        NSString *status = [responseObject objectForKey:@"status"];
        if ([status isEqualToString:@"OK"]) {
            NSDictionary *result = [responseObject objectForKey:@"results"];
            scc(result);
        }else
        {
            NSString *tip = [ErrorCode showErrorMsg:responseObject];
            if (fail) {
                fail(tip);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----%@--%@--%@",url,param,error);
        
        NSString *tip = [ErrorCode handleError:error.code];
        if (fail) {
            fail(tip);
        }
    }];
}







+(instancetype)shareInstance
{
    static dispatch_once_t token;
    static TXBasicNet *basicNet;
    dispatch_once(&token, ^{
        basicNet = [[TXBasicNet alloc]init];
    });
    return basicNet;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = 5;
        NSString *accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"accessToken"];
        if (accessToken) {
            [manager.requestSerializer setValue:accessToken forHTTPHeaderField:@"AuthToken"];
        }
    }
    return self;
}

@end
