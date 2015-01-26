//
//  TableDataSource.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSTableDataSource.h"

@interface KSTableDataSource ()
@property (copy, nonatomic) NSString *cellIdentifier;


@end

@implementation KSTableDataSource

- (id)initWithCellIdentifier:(NSString *)cellIdentifier cellconfigureBlock:(UITableViewCell *(^)(UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath))cellConfigureBlock
{
    self = [super init];
    if (self)
    {
        self.cellIdentifier = cellIdentifier;
        self.cellConfigureBlock = [cellConfigureBlock copy];
        self.tableItems = [NSMutableArray array];
    }
    return self;
}
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return self.tableItems[indexPath.section][indexPath.row];
    }else
    {
        return self.tableItems[indexPath.row];
    }
    
}


#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return [self.tableItems count];
    }else
    {
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return [[self.tableItems objectAtIndex:section] count];
    }else
    {
        return self.tableItems.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    return self.CellConfigureBlock(cell,item,indexPath);
    
}

@end
