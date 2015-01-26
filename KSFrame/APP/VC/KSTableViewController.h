//
//  KSTableViewController.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSRefreshViewController.h"
#import "KSTableView.h"
#import "KSTableDataSource.h"
#import "KSTableDelegate.h"
#import "KSTableViewCell.h"
@interface KSTableViewController : KSRefreshViewController
@property(nonatomic,strong)KSTableView *tableView;
@property(nonatomic,strong)KSTableDataSource *tableDataSource;
@property(nonatomic,strong)KSTableDelegate *tableDelegate;
@property(nonatomic,strong)LoadMoreTableFooterView *tableFootView;
@end
