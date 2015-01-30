//
//  LTMyLotteryViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-26.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyLotteryViewController.h"
#import "LTMyLotteryTableViewCell.h"
#import "LTphoneRecord.h"
@interface LTMyLotteryViewController ()

@end

@implementation LTMyLotteryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[LTphoneRecord alloc]init];
    [self.params setDictionary:@{@"user":@"test_qiu", @"password":[@"123456" stringFromMD5], @"version":@"13", @"page":[NSString stringWithFormat:@"%lu",self.pageCount], @"result":@"全部"}];
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
    self.tableView.tableDataSource.cellClassName=NSStringFromClass([LTMyLotteryTableViewCell class]);
    [self.tableView.tableDataSource setCellConfigureBlock :^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        LTMyLotteryTableViewCell *tableViewcell = (LTMyLotteryTableViewCell *)cell;
        LTphoneRecord *phoneRecord = (LTphoneRecord *)cellDatas;
        [tableViewcell.lblLotteryType setText:phoneRecord.type];
        [tableViewcell.lblMoney setText:[NSString stringWithFormat:@"中奖金额：%@",phoneRecord.winMoney]];
        [tableViewcell.lblState setText:phoneRecord.status];
        [tableViewcell.lblTime setText:[[NSDate dateWithTimeIntervalSince1970:[phoneRecord.time doubleValue]/1000] convertDateToStringWithFormat:@"yyyy-MM-dd hh:mm"]];
        [tableViewcell.lblResult setText:phoneRecord.result];
        return tableViewcell;
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * #pragma mark - Navigation
 *
 *   // In a storyboard-based application, you will often want to do a little preparation before navigation
 *   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 *    // Get the new view controller using [segue destinationViewController].
 *    // Pass the selected object to the new view controller.
 *   }
 */

@end