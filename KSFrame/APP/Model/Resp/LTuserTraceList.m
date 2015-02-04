//
//  LTuserTraceList.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTuserTraceList.h"

@implementation LTuserTraceList
+(NSDictionary *)requestParams:(NSUInteger)page
{
    return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13", @"count":@"10",@"offset":[NSString stringWithFormat:@"%lu",(page-1)*10]};
}
@end
