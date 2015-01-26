//
//  TableDataSource.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSTableViewCell.h"




@interface KSTableDataSource : NSObject <UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *tableItems;
@property (copy, nonatomic) UITableViewCell* (^CellConfigureBlock) (UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath);
- (id)initWithCellIdentifier:(NSString *)cellIdentifier
          cellconfigureBlock:(UITableViewCell *(^)(UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath))cellConfigureBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
