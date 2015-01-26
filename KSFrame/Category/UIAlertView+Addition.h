//
//  UIAlertView+Addition.h
//  Line0
//
//  Created by line0 on 12-12-4.
//  Copyright (c) 2012年 line0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Addition)
/**
 *  简单的alertView提示
 *
 *  @param title <#title description#>
 *  @param msg   <#msg description#>
 */
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)msg;

@end
