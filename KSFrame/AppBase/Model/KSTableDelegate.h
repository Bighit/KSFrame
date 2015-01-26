//
//  TableDelegate.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-15.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>






@interface KSTableDelegate : NSObject <UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray    *tableItems;

@property (copy, nonatomic) void (^SelectCellBlock) (NSIndexPath *indexPath, id item);
@property (copy, nonatomic) CGFloat (^CellHeightBlock) (NSIndexPath *indexPath);//如果没有设置，则为默认的44高
@property (copy, nonatomic) UIView* (^HeaderViewConfigureBlock) (UITableView *view, NSInteger section) ;
@property (copy, nonatomic) UIView* (^FooterViewConfigureBlock) (UITableView *view, NSInteger section) ;
@end
