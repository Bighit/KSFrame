//
//  LTMyJoinedViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-2.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyJoinedViewController.h"
#import "LTphoneMyHemai.h"
#import "LTMyJoinedTableViewCell.h"
@interface LTMyJoinedViewController ()

@end

@implementation LTMyJoinedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data=[[LTphoneMyHemai alloc]init];
    [self.params setDictionary:[LTphoneMyHemai requestParams:self.pageCount]];
    // Do any additional setup after loading the view.
}

- (void)setTableViewDelegate
{
    [self.tableView.tableDelegate setCellHeightBlock:^CGFloat (NSIndexPath *indexPath) {
        return 70;
    }];
}

- (void)setTableViewDataSource
{
    self.tableView.tableDataSource.cellClassName=NSStringFromClass([LTMyJoinedTableViewCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:self.tableView.tableDataSource.cellClassName bundle:nil] forCellReuseIdentifier:self.tableView.tableDataSource.cellClassName];
    [self.tableView.tableDataSource setCellConfigureBlock :^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        LTMyJoinedTableViewCell *tableViewcell = (LTMyJoinedTableViewCell *)cell;
        LTphoneMyHemai *content = (LTphoneMyHemai *)cellDatas;
        [tableViewcell setCellViewWithContent:content];
        return tableViewcell;
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
