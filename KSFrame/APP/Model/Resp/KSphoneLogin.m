//
//  LSLogin.m
//  DYJLotteryTicket
//
//  Created by ddyyjj on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KSphoneLogin.h"

@implementation KSphoneLogin

+(NSDictionary *)requestParams
{
    return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13"};
}
@end
