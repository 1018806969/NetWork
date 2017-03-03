//
//  TXBasicNet.h
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^result)(id response);

@interface TXBasicNet : NSObject

/**
 post

 @param url url
 @param param param
 @param scc scc
 @param fail fail
 */
-(void)post:(NSString *)url param:(NSDictionary *)param scc:(result)scc fail:(result)fail;

/**
 get

 @param url url
 @param param param
 @param scc scc
 @param fail fail
 */
-(void)get:(NSString *)url param:(NSDictionary *)param scc:(result)scc fail:(result)fail;



/**
 单例

 @return instance
 */
+(instancetype)shareInstance;
@end
