//
//  KSUserInfo.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-13.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSphoneUserInfo.h"

@implementation KSphoneUserInfo

+(NSDictionary *)requestParams
{
    return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13"};
}
@end
