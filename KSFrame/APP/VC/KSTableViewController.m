//
//  KSTableViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "KSTableViewController.h"

@interface KSTableViewController ()

@end

@implementation KSTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView=[[KSTableView alloc]init];
    [self.view addSubview:_tableView];
    [self setTableViewDataSource];
    [self setTableViewDelegate];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table DataSource && Delegate

- (void)setTableViewDataSource
{
 
    self.tableDataSource = [[KSTableDataSource alloc] initWithCellIdentifier:[self description] cellconfigureBlock:^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath) {
        if (cell==nil) {
            cell=[[KSTableViewCell alloc]init];
        }
        //加载数据
        return cell;
    }];
    self.tableDataSource.tableItems=self.data;
    [self.tableView setDataSource:self.tableDataSource];
}

- (void)setTableViewDelegate
{
    WS(_self)
    self.tableDelegate = [[KSTableDelegate alloc] init];
    self.tableDelegate.tableItems=self.data;
    [self.tableDelegate setCellHeightBlock:^(NSIndexPath *indexPath)
     {
         //加载cell 高度
         KSTableViewCell *tableViewCell=(KSTableViewCell *)[_self.tableView cellForRowAtIndexPath:indexPath];
         return [tableViewCell cellViewFrame].size.height;
     }];
    [self.tableDelegate setSelectCellBlock:^(NSIndexPath *indexPath, id item)
     {
         //点击cell时候触发的事件
     }];
    
    [self.tableView setDelegate:self.tableDelegate];
}
-(void)refresh
{
    [self.tableView reloadData];
}
#pragma mark - loadMore
- (void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView*)view
{
    [self refresh];
}
- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView*)view
{
    WS(_self)
    [Single(KSRequest)requestDataWithParams:nil Class:[self.data class] finished:^(id object) {
        NSMutableArray *arr=[[NSMutableArray alloc]initWithArray:_self.data];
        if ([object isKindOfClass:[NSArray class]]) {
            [arr addObjectsFromArray:object];
        }
        [_self refresh];
    } failed:^(NSString *error) {
        NSLog(@"网络问题");
    }];
    return YES;
}


#pragma mark - Model Data Update

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
