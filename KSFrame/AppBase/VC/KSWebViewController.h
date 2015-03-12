//
//  KSWebViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-9.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSViewController.h"

@interface KSWebViewController : KSViewController<UIWebViewDelegate>

@property(nonatomic,strong,readonly)UIWebView *webView;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *navTitle;
@end
