//
//  KSViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    KSNavigationBarItemPositonLeft                    =0,
    KSNavigationBarItemPositonRight                   =1,
} KSNavigationBarItemPositon;

@interface KSViewController : UIViewController
- (void)showBarButton:(KSNavigationBarItemPositon)position title:(NSString *)name fontColor:(UIColor *)color;
- (void)showBarButton:(KSNavigationBarItemPositon)position imageName:(NSString *)imageName;
- (void)showBarButton:(KSNavigationBarItemPositon)position button:(UIButton *)button;
- (void)showBarButton:(KSNavigationBarItemPositon)position view:(UIView *)view;
- (void)leftButtonClicked;
- (void)rightButtonClicked;
- (void)setTitleText:(NSString *)str;
-(void)navigationReplace:(UIViewController *)vc inIndex:(NSUInteger)index;
-(void)navigationReplaceCurrentControllerWith:(UIViewController *)vc;
@end
