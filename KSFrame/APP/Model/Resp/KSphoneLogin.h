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

@interface KSphoneLogin : NSObject

@property (nonatomic,strong) NSString *status;//状态
@property (nonatomic,strong) NSString *balance;//余额
@property (nonatomic,assign) NSInteger redbagNum;
@property (nonatomic,strong) NSString *message;//错误代码

@end
