//
//  RequestApi.m
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "RequestApi.h"
#import "TXBasicNet.h"
#import <UIKit/UIKit.h>
#import "API.h"
#import "UserInfo.h"
#import "MJExtension.h"

static NSString *const ACCESSTOKEN = @"accessToken";
static NSString *const USERINFO    = @"userinfo";

@implementation RequestApi

+(void)loginWithParam:(NSDictionary *)param scc:(result)scc
{
    [[TXBasicNet shareInstance]post:Domain(@"/users/token") param:param scc:^(id response) {
        NSString *accessToken = [response objectForKey:@"accessToken"];
        [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:ACCESSTOKEN];
        UserInfo *userInfo = [UserInfo mj_objectWithKeyValues:[response objectForKey:@"userInfo"]];
//        [[NSUserDefaults standardUserDefaults]setObject:userInfo forKey:USERINFO];
        scc(userInfo);
    } fail:nil];
}
+(void)orderListPage:(int)page limit:(int)limit scc:(result)scc
{
    NSString *api = [NSString stringWithFormat:@"/orders?limit=%i&page=%i",limit,page];
    [[TXBasicNet shareInstance]get:Domain(api) param:nil scc:^(id response) {
        
    } fail:nil];
}
@end
