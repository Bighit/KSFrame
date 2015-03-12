//
//  KSRespBases.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-2.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSUserDataManager.h"
@interface KSRespBase : NSObject
@property(nonatomic,copy)NSString * status;
@property(nonatomic,copy)NSString * message;
+(NSDictionary *)requestParams;
+(NSDictionary *)requestParams:(NSUInteger )page;
@end
