//
//  NetworkReachabilityManager.m
//  NetWork
//
//  Created by txx on 17/3/3.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "NetworkReachabilityManager.h"
#import "AFNetworkReachabilityManager.h"
#import "TipLabel.h"

@implementation NetworkReachabilityManager

+(void)networkMonitor
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [TipLabel show:@"未识别的网络"];
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                [TipLabel show:@"网络不可用(未连接)"];

                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [TipLabel show:@"蜂窝网络"];

                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [TipLabel show:@"wifi网络"];
                
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}
@end
