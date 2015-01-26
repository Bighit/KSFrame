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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data=[[LTphoneRecord alloc]init];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
    [self.tableDataSource setCellConfigureBlock:^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        if (!cell) {
            cell=[[LTMyLotteryTableViewCell alloc]init];
        }
        return cell;
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refresh
{
    
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
