//
//  KSRefreshViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-15.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"

@implementation KSRefreshViewController

 - (void)viewDidLayoutSubviews {
    if(self.pullToRefreshView == nil) {
        self.pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:(UIScrollView *)self.view delegate:self];
    }
 }
- (void)loadView {
    [super loadView];
    //将view替换成scrollview
        UIScrollView *mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectZero];
        self.view=mainScrollView;
        [self.view setBackgroundColor:kAppBgColor];
    //
    self.progressHUD=[[MBProgressHUD alloc]initWithView:self.view];
    
}
- (void)viewDidUnload {
    [super viewDidUnload];
    self.pullToRefreshView = nil;
    self.progressHUD=nil;
}
-(void)setViewContentSize:(CGSize)size
{
    if([self.view isKindOfClass:[UIScrollView class]])
    {
        [(UIScrollView *)self.view setContentSize:size];
    }
}

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    WS(_self)
    [self.pullToRefreshView startLoading];//
    [self.view addSubview:_progressHUD];
    [_progressHUD show:YES];
    [Single(KSRequest)requestDataWithParams:self.params Class:[_data class] finished:^(id object) {
        _self.data=object;
        [_self refresh];
        [_self.pullToRefreshView finishLoading];
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    } failed:^(NSString *error) {
        mAlertView(@"提示", @"网络无法连接");
        [_self.pullToRefreshView finishLoading];
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    }];
    
}
#pragma mark - method
- (void)refresh {
    //重写此方法 刷新界面
    
}
//-(void)setViewContentSize:(CGSize)size
//{
//    if ([self.view isKindOfClass:[UIScrollView class]]) {
//        [(UIScrollView *)self.view setContentSize:size];
//    }
//}
@end
