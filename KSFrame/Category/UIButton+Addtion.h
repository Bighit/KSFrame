//
//  UIButton+Addtion.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Addtion)
/**
 *  用图片创建NavigationButton
 *
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
-(UIButton *)initNavigationButton:(UIImage *)image;
/**
 *  字符串创建NavigationButtonWith并指定颜色
 *
 *  @param str   <#str description#>
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color;
@end
