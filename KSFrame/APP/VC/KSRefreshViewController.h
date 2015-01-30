//
//  KSRefreshViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-15.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSViewController.h"

@interface KSRefreshViewController : KSViewController
@property(nonatomic,strong)MBProgressHUD *progressHUD;
@property(nonatomic,strong)id data;//数据
@property(nonatomic,strong)NSMutableDictionary* params;//参数
- (void)refresh;
-(void)setViewContentSize:(CGSize)size;
@end
