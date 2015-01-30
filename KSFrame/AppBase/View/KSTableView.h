//
//  KSTableView.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSTableDataSource.h"
#import "KSTableDelegate.h"
@interface KSTableView : UITableView
@property(nonatomic,strong)NSMutableArray *tableItems;
@property(nonatomic,strong)KSTableDataSource *tableDataSource;
@property(nonatomic,strong)KSTableDelegate *tableDelegate;
- (void)initTableViewDataSource;
- (void)initTableViewDelegate;
-(NSString *)stringWithCellClassName;
@end
