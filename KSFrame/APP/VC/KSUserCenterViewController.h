//
//  KSUserCenterViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-30.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"
#import "KSUserCenter.h"
#import "KSphoneUserInfo.h"
@interface KSUserCenterViewController :KSRefreshViewController
@property(nonatomic,strong)NSString *cellIentifier;
@property(nonatomic,strong)KSUserCenter *viewWithXib;
@property(nonatomic,strong)KSphoneUserInfo *userInfo;
@property(nonatomic,strong)NSMutableArray *tableItems;
@end
