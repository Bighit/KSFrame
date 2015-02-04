//
//  LTMyCatchOnViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyCatchOnViewController.h"
#import "LTMyCatchOnTableViewCell.h"
@interface LTMyCatchOnViewController ()

@end

@implementation LTMyCatchOnViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.data=[[LTuserTraceList alloc]init];
    [self.params setDictionary:[[self.data class] requestParams:self.pageCount]];
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
    self.tableView.tableDataSource.cellClassName=NSStringFromClass([LTMyCatchOnTableViewCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:self.tableView.tableDataSource.cellClassName bundle:nil] forCellReuseIdentifier:self.tableView.tableDataSource.cellClassName];
    [self.tableView.tableDataSource setCellConfigureBlock :^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        LTMyCatchOnTableViewCell *tableViewcell = (LTMyCatchOnTableViewCell *)cell;
        LTuserTraceList *content = (LTuserTraceList *)cellDatas;
        [tableViewcell setCellViewWithContent:content];
        return tableViewcell;
    }];
    
}

- (NSArray *)analyseTableData:(id)object
{
    LTuserTraceList *temp=object;
    if (temp.records) {
        self.pageCount++;
        return temp.records;
    } else {
        if (temp.message) {
            mAlertView(@"提示", temp.message);
        }
        
        return nil;
    }
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
