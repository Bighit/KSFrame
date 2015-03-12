//
//  UserDataManager.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-12.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSUserDataManager : NSObject
+(void)savePassWord:(NSString *)password andUserName:(NSString *)username;

+(id)readPassWord;
+(id)readUserName;
+(void)deletePassWord;
@end
