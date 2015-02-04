//
//  LTuserPayList.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-4.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTuserPayList.h"

@implementation LTuserPayList
+(NSDictionary *)requestParams:(NSUInteger)page
{
        return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13", @"page":[NSString stringWithFormat:@"%lu",page]};
}
@end
