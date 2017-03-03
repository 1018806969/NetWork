//
//  RequestApi.h
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^result)(id response);

@interface RequestApi : NSObject

/**
 登录 post   /users/token

 @param param {phone,password,loginType}
 @param scc scc
 */
+(void)loginWithParam:(NSDictionary *)param scc:(result)scc;

/**
 订单 get   /orders?limit=%i&page=%i

 @param page 页码
 @param limit 每页记录数
 @param scc scc
 */
+(void)orderListPage:(int)page limit:(int)limit scc:(result)scc;



@end
