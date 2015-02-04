//
//  LTuserPayList.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-4.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRespBase.h"

@interface LTuserPayList : KSRespBase

@property (nonatomic,copy)NSString *inout;
@property (nonatomic,copy)NSString *addtime;
@property (nonatomic,copy)NSString *money;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *paymoney;
@property (nonatomic,copy)NSString *type;
@end
