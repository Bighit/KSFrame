//
//  UIView+Animation.h
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

/**
 *  direction取值:kCATransitionFromTop  kCATransitionFromBottom
 *               kCATransitionFromLeft kCATransitionFromRight
 */

#define kCameraEffectOpen  @"cameraIrisHollowOpen"
#define kCameraEffectClose @"cameraIrisHollowClose"


#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface UIView (Animation)

/**
 *  揭开
 *
 *  @param view      <#view description#>
 *  @param direction   kCATransitionFromLeft   kCATransitionFromBottom kCATransitionFromRight kCATransitionFromTop
 　
 */
+ (void)animationReveal:(UIView *)view direction:(NSString *)direction;

/**
 *  渐消渐隐
 *
 *  @param view <#view description#>
 */
+ (void)animationFade:(UIView *)view;

/**
 *  翻转
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationFlip:(UIView *)view direction:(NSString *)direction;

/**
 *  旋转缩放
 *
 *  @param view <#view description#>
 */
+ (void)animationRotateAndScaleEffects:(UIView *)view;//各种旋转缩放效果。
/**
 *  旋转同时缩小放大效果 组合动画
 *
 *  @param view <#view description#>
 */
+ (void)animationRotateAndScaleDownUp:(UIView *)view;//旋转同时缩小放大效果

/**
 *  push
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationPush:(UIView *)view direction:(NSString *)direction;

//Curl UnCurl
/**
 *  curl
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationCurl:(UIView *)view direction:(NSString *)direction;
/**
 *  uncurl
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationUnCurl:(UIView *)view direction:(NSString *)direction;

/**
 *  move
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationMove:(UIView *)view direction:(NSString *)direction;

/**
 *  立方体
 *
 *  @param view      <#view description#>
 *  @param direction <#direction description#>
 */
+ (void)animationCube:(UIView *)view direction:(NSString *)direction;
/**
 *  水波纹
 *
 *  @param view <#view description#>
 */
+ (void)animationRippleEffect:(UIView *)view;

/**
 *  相机开合
 *
 *  @param view <#view description#>
 *  @param type cameraIrisHollowOpen  cameraIrisHollowClose
 */
+ (void)animationCameraEffect:(UIView *)view type:(NSString *)type;

/**
 *  吸收
 *
 *  @param view <#view description#>
 */
+ (void)animationSuckEffect:(UIView *)view;
/**
 *  未知1
 *
 *  @param view <#view description#>
 */
+ (void)animationBounceOut:(UIView *)view;
/**
 *  缩小
 *
 *  @param view <#view description#>
 */
+ (void)animationBounceIn:(UIView *)view;
/**
 *  view消失
 *
 *  @param view <#view description#>
 */
+ (void)animationBounce:(UIView *)view;

/**
 *  从一个位置移动到另一个位置 x,y为移动后的坐标
 */
+(void)animationMoveToMove:(UIView *)view andx:(CGFloat)x andy:(CGFloat)y;
/**
 *  动画学习代码
 */
+(void)animationStudy :(UIView *)view;
/**
 *  UIimageVIew 动画
 *
 *  @param imageView <#imageView description#>
 */
+(void)uiimageanimation:(UIImageView*)imageView;

@end
