//
//  TableDataSource.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSTableDataSource.h"

@interface KSTableDataSource ()

@end

@implementation KSTableDataSource

- (id)initWithCellClassName:(NSString *)cellClassName cellconfigureBlock:(UITableViewCell *(^)(UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath))cellConfigureBlock
{
    self = [super init];

    if (self) {
        self.cellClassName = cellClassName;
        self.cellConfigureBlock = [cellConfigureBlock copy];
        self.tableItems = [NSMutableArray array];
    }

    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (([_tableItems  count] > 0) && [[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return self.tableItems[indexPath.section][indexPath.row];
    } else {
        return self.tableItems[indexPath.row];
    }
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (([_tableItems  count] > 0) && [[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return [self.tableItems count];
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (([_tableItems  count] > 0) && [[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return [[self.tableItems objectAtIndex:section] count];
    } else {
        return self.tableItems.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellClassName];
        if (!cell) {
        cell = [[NSClassFromString(_cellClassName) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellClassName];
    }

    id item = [self itemAtIndexPath:indexPath];
    return self.CellConfigureBlock(cell, item, indexPath);
}

@end