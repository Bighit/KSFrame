//
//  LTphoneMyHemai.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-2.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTphoneMyHemai.h"

@implementation LTphoneMyHemai

+(NSDictionary *)requestParams:(NSUInteger)page
{
    return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13", @"page":[NSString stringWithFormat:@"%lu",page]};
}
@end
