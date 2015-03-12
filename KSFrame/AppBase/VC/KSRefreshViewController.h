//
//  KSRefreshViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-15.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSViewController.h"
#import "KSRespBase.h"
@protocol KSRefreshViewControllerDelegate
- (void)refresh;
@end
@interface KSRefreshViewController : KSViewController<KSRefreshViewControllerDelegate>
@property(nonatomic,strong)KSRespBase *data;//网路数据
@property(nonatomic,strong)NSMutableDictionary* params;//参数
-(void)setViewContentSize:(CGSize)size;
- (void)pullToRefresh;
@end

