//
//  KSRefreshViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-15.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"

@implementation KSRefreshViewController

- (void)loadView
{
    [super loadView];
    // 将view替换成scrollview
    UIScrollView *mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    self.view = mainScrollView;
    [self.view setBackgroundColor:kAppBgColor];
    //下拉刷新
    WS(_self)
    [mainScrollView addPullToRefreshWithActionHandler :^{
        [_self performSelector:@selector(pullToRefresh) withObject:nil afterDelay:0.2];
    }];
    
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.params = [[NSMutableDictionary alloc]init];
}

- (void)setViewContentSize:(CGSize)size
{
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        [(UIScrollView *)self.view setContentSize : size];
    }
}

- (void)pullToRefresh
{
    WS(_self)
    
    [Singleton(KSGlobal).progressHUD show:YES];
    [Singleton(KSRequest)requestDataWithParams:self.params Class:[_data class] finished:^(id object) {
        _self.data = object;
        if (_self.data.message) {
            mAlertView(@"提示", _self.data.message);
        }
        [_self refresh];
        [Singleton(KSGlobal).progressHUD hide:YES];
    } failed:^(NSString *error) {
        mAlertView(@"提示", @"网络无法连接");
        [Singleton(KSGlobal).progressHUD hide:YES];
    }];
}

#pragma mark - method
- (void)refresh
{
    NSLog(@"请求完毕，刷新视图");
    [((UIScrollView *)self.view).pullToRefreshView stopAnimating];
    // 重写此方法 刷新界面
}

@end