//
//  KSTableViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"
#import "KSTableView.h"
@interface KSTableViewController : KSRefreshViewController
@property(nonatomic,strong)KSTableView *tableView;
@property(nonatomic,assign)NSUInteger pageCount;
- (void)setTableViewDataSource;
- (void)setTableViewDelegate;
@end
