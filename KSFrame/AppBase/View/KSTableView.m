//
//  KSTableView.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSTableView.h"

@implementation KSTableView
- (instancetype)init
{
    self = [super init];

    if (self) {
        [self initTableViewDataSource];
        [self initTableViewDelegate];
        self.tableItems = [[NSMutableArray alloc]init];
    }

    return self;
}

- (void)setTableItems:(NSMutableArray *)tableItems
{
    _tableItems = nil;
    _tableItems = tableItems;
    self.tableDataSource.tableItems = tableItems;
    self.tableDelegate.tableItems = tableItems;
}

- (void)initTableViewDataSource
{
    self.tableDataSource = [[KSTableDataSource alloc] init];
    [self setDataSource:self.tableDataSource];
}

- (void)initTableViewDelegate
{
    self.tableDelegate = [[KSTableDelegate alloc] init];
    [self setDelegate:self.tableDelegate];
}

- (NSString *)stringWithCellClassName
{
    UITableViewCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

    return NSStringFromClass([cell class]);
}

@end