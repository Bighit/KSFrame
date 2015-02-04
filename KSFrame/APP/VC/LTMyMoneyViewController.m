//
//  LTMyMoneyViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-4.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyMoneyViewController.h"
#import "LTMyMoneyTableViewCell.h"
@interface LTMyMoneyViewController ()

@end

@implementation LTMyMoneyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data=[[LTuserPayList alloc]init];
    [self.params setDictionary:[[self.data class] requestParams:self.pageCount]];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTableViewDelegate
{
    [self.tableView.tableDelegate setCellHeightBlock:^CGFloat (NSIndexPath *indexPath) {
        return 29;
    }];
}

- (void)setTableViewDataSource
{
    self.tableView.tableDataSource.cellClassName=NSStringFromClass([LTMyMoneyTableViewCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:self.tableView.tableDataSource.cellClassName bundle:nil] forCellReuseIdentifier:self.tableView.tableDataSource.cellClassName];
    [self.tableView.tableDataSource setCellConfigureBlock :^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        LTMyMoneyTableViewCell *tableViewcell = (LTMyMoneyTableViewCell *)cell;
        LTuserPayList *content = (LTuserPayList *)cellDatas;
        [tableViewcell setCellViewWithContent:content];
        return tableViewcell;
    }];
    
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
