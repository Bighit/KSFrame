//
//  LSLogin.h
//  DYJLotteryTicket
//
//  Created by ddyyjj on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, LSLoginOption) {
//    LSLoginOptionTelphone=0,
//    LSLoginOptionUserName
//};

@interface KSphoneLogin : KSRespBase

@property (nonatomic,copy) NSString *status;//状态
@property (nonatomic,copy) NSString *balance;//余额
@property (nonatomic,assign) NSInteger redbagNum;
@property (nonatomic,copy) NSString *message;//错误代码

@end
