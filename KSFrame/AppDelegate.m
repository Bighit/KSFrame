//
//  AppDelegate.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-11.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "SliderViewController.h"
#import "KSNavigationController.h"
#import "GasStationListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [IQKeyboardManager sharedManager];
   
    //
    [SliderViewController sharedSliderController].LeftVC=[[UIViewController alloc] init];
    [SliderViewController sharedSliderController].RightVC=[[UIViewController alloc] init];
    
    [SliderViewController sharedSliderController].RightSContentOffset=260;
    [SliderViewController sharedSliderController].RightSContentScale=0.6;
    [SliderViewController sharedSliderController].RightSOpenDuration=0.8;
    [SliderViewController sharedSliderController].RightSCloseDuration=0.8;
    [SliderViewController sharedSliderController].RightSJudgeOffset=160;
    
    GasStationListViewController *gasController=[[GasStationListViewController alloc]initWithNibName:@"GasStationListViewController" bundle:nil];
    KSNavigationController *navigationController=[[KSNavigationController alloc]initWithRootViewController:gasController];
    [[SliderViewController sharedSliderController] showContentController: navigationController];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[SliderViewController sharedSliderController]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    // hud

    Singleton(KSGlobal).progressHUD = [[MBProgressHUD alloc]initWithView:self.window];
    [mKeyWindow addSubview : Singleton(KSGlobal).progressHUD];


    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
