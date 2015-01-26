//
//  TableDelegate.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSTableDelegate.h"

@implementation KSTableDelegate

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tableItems = [NSMutableArray array];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.CellHeightBlock)
    {
       return self.CellHeightBlock(indexPath);
    }
    
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.SelectCellBlock) {
        id item;
        if ([[self.tableItems objectAtIndex:0] isKindOfClass:[NSArray class]]) {
             item= self.tableItems[indexPath.section][indexPath.row];
        }else
        {
            item= self.tableItems[indexPath.row];
        }
        
        self.SelectCellBlock(indexPath, item);
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.HeaderViewConfigureBlock) {
        return self.HeaderViewConfigureBlock(tableView,section);
    }
    return tableView.tableHeaderView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.FooterViewConfigureBlock) {
        return self.FooterViewConfigureBlock(tableView,section);
    }
    return tableView.tableFooterView;
}

@end
