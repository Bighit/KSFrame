//
//  KSRefreshViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-15.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"

@implementation KSRefreshViewController

- (void)loadView {
    [super loadView];
    //将view替换成scrollview
        UIScrollView *mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectZero];
        self.view=mainScrollView;
        [self.view setBackgroundColor:kAppBgColor];
    //下拉刷新
    WS(_self)
    [mainScrollView addPullToRefreshWithActionHandler:^{
        [_self performSelector:@selector(pullToRefresh) withObject:nil afterDelay:0.2];
    }];
    //hud
    self.progressHUD=[[MBProgressHUD alloc]initWithView:self.view];
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.params=[[NSMutableDictionary alloc]init];
}

-(void)setViewContentSize:(CGSize)size
{
    if([self.view isKindOfClass:[UIScrollView class]])
    {
        [(UIScrollView *)self.view setContentSize:size];
    }
}

- (void)pullToRefresh
{
    WS(_self)
    [mKeyWindow addSubview:_progressHUD];
    [_progressHUD show:YES];
    [Singleton(KSRequest)requestDataWithParams:self.params Class:[_data class] finished:^(id object) {
        _self.data=object;
        [_self refresh];
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    } failed:^(NSString *error) {
        mAlertView(@"提示", @"网络无法连接");
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    }];
    
}
#pragma mark - method
- (void)refresh {
    NSLog(@"请求完毕，刷新视图");
    [((UIScrollView *)self.view).pullToRefreshView stopAnimating];
    //重写此方法 刷新界面
    
}

@end
