//
//  KSGlobal.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-12.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, LotteryType) {
    LotteryTypeJCZQ = 0,
    LotteryTypeJCLQ = 1,
    LotteryTypeSSQ = 2,
    LotteryTypeK3 = 3,
    LotteryTypeXYSC = 4,
    LotteryTypePOKER3 = 5,
    LotteryType11X5 = 6,
    LotteryType11X5N = 7,
    LotteryType11YDJ = 8,
    LotteryTypeBD = 9,
    LotteryTypeR9 = 11,
    LotteryTypeBQC = 12,
    LotteryTypeJQS = 13
};
@interface KSGlobal : NSObject
@property(nonatomic,assign)LotteryType currentLotteryType;

CSingleton(KSGlobal)
@end
