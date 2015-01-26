//
//  KSRequest.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSRequest : NSObject


CSingleton(KSRequest)
- (void)requestDataWithParams:(NSDictionary *)params
                      forPath:(NSString *)path
                     finished:(void(^)(id data))success
                       failed:(void(^)(NSString *error))fail;
- (void)requestDataWithParams:(NSDictionary *)params
                        Class:(Class)objClass
                     finished:(void(^)(id object))success
                       failed:(void(^)(NSString *error))fail;
- (void)postDataWithParams:(NSDictionary *)params
                      forPath:(NSString *)path
                     finished:(void(^)(id data))success
                       failed:(void(^)(NSString *error))fail;
- (void)postDataWithParams:(NSDictionary *)params
                        Class:(Class)objClass
                     finished:(void(^)(id object))success
                       failed:(void(^)(NSString *error))fail;
@end
