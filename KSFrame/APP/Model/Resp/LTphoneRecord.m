//
//  LSNews.m
//  DYJLotteryTicket
//
//  Created by ddyyjj on 12-3-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LTphoneRecord.h"

@implementation LTphoneRecord

+(NSDictionary *)requestParams:(NSUInteger)page
{
    return @{@"user":@"test_qiu", @"password":[@"654321" stringFromMD5], @"version":@"13", @"page":[NSString stringWithFormat:@"%lu",page], @"result":@"全部"};
}
@end
