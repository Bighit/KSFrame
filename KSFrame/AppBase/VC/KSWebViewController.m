//
//  KSWebViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-9.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSWebViewController.h"

@interface KSWebViewController ()

@end

@implementation KSWebViewController

- (void)loadView{
    [super loadView];
    _webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.delegate=self;
    [self.view addSubview:_webView];
    //layout
    WS(_self)
    [_webView mas_makeConstraints :^(MASConstraintMaker *make) {
        make.edges.equalTo(_self.view).with.insets(UIEdgeInsetsZero);
    }];
    
    //下拉刷新
    [_webView.scrollView addPullToRefreshWithActionHandler :^{
        [_self performSelector:@selector(pullToRefresh) withObject:nil afterDelay:0.2];
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [self setBarButtonItemIsClose:NO];
    self.navigationItem.title=_navTitle;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [Singleton(KSGlobal).progressHUD show:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [Singleton(KSGlobal).progressHUD hide:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [Singleton(KSGlobal).progressHUD hide:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}
- (void)pullToRefresh
{
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
