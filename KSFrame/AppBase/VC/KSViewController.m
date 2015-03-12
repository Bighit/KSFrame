//
//  KSViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSViewController.h"

@implementation KSViewController


- (void)showBarButton:(KSNavigationBarItemPositon)position title:(NSString *)name fontColor:(UIColor *)color
{
    UIButton *button = [[UIButton alloc] initNavigationButtonWithTitle:name color:color];

    [self showBarButton:position button:button];
}

- (void)showBarButton:(KSNavigationBarItemPositon)position imageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc] initNavigationButton:[UIImage imageNamed:imageName]];

    [self showBarButton:position button:button];
}
- (void)showBarButton:(KSNavigationBarItemPositon)position view:(UIView *)view
{
    if (KSNavigationBarItemPositonLeft == position) {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    if (mSystemVersion >= 7) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    }else
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    }
}
- (void)showBarButton:(KSNavigationBarItemPositon)position button:(UIButton *)button
{
    if (KSNavigationBarItemPositonLeft == position) {
        [button addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

        if (mSystemVersion >= 7) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    } else if (KSNavigationBarItemPositonLeft == position) {
        [button addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

- (void)leftButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonClicked {}

- (void)setTitleText:(NSString *)str
{
    if (self.navigationItem.titleView != nil) {
        [self.navigationItem.titleView removeFromSuperview];
        self.navigationItem.titleView = nil;
    }

    if (![self.title isEqualToString:@""]) {
        UIView  *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titleView.width, 44)];
        titleLabel.tag = 100;
        titleLabel.text = str;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:18.0f];
        titleLabel.frame = CGRectMake(0, 0, titleLabel.autoSize.width, 44);
        titleView.frame = titleLabel.frame;
        [titleView addSubview:titleLabel];
        self.navigationItem.titleView = titleView;
    }
}
-(void)navigationReplace:(UIViewController *)vc inIndex:(NSUInteger)index
{
    NSArray *currentControllers = self.navigationController.viewControllers;
    NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
    [newControllers replaceObjectAtIndex:index withObject:vc];
    self.navigationController.viewControllers = newControllers;
}
-(void)navigationReplaceCurrentControllerWith:(UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
    NSArray *currentControllers = self.navigationController.viewControllers;
    NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
    [newControllers removeObjectAtIndex:[newControllers count]-2];
    self.navigationController.viewControllers = newControllers;
}
@end