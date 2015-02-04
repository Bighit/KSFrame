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
- (void)loadView
{
    [super loadView];
    // 将view替换成scrollview
    self.tableView = [[KSTableView alloc]init];
    self.view = self.tableView;
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    //上拉加载 下拉刷新
    WS(_self)

    [_tableView addPullToRefreshWithActionHandler :^{
        [_self performSelector:@selector(loadMore) withObject:nil afterDelay:0.2];
    } position : SVPullToRefreshPositionBottom];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pageCount = 1;
    [self setTableViewDataSource];
    [self setTableViewDelegate];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self pullToRefresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table DataSource && Delegate

- (void)setTableViewDataSource
{
    // 子类完成
    self.tableView.tableDataSource.cellClassName = NSStringFromClass([UITableViewCell class]);
    [self.tableView.tableDataSource setCellConfigureBlock:^UITableViewCell *(UITableViewCell *cell, id cellDatas, NSIndexPath *indexpath) {
        return cell;
    }];
}

- (void)setTableViewDelegate
{
    // 子类完成
    [self.tableView.tableDelegate setCellHeightBlock:^CGFloat (NSIndexPath *indexPath) {
        return 40;
    }];
}

- (void)refresh
{
    [super refresh];
    [self.params setDictionary:[[self.data class] requestParams:self.pageCount]];
    [self.tableView reloadData];
    NSLog(@"数据总数：%lu，页码：%lu", [_tableView.tableItems count], _pageCount - 1);
}

- (void)pullToRefresh
{
    WS(_self)
    [mKeyWindow addSubview : self.progressHUD];
    [self.progressHUD show:YES];
    [Singleton(KSRequest)requestDataWithParams:self.params Class:[self.data class] finished:^(id object) {
        [_tableView.tableItems setArray:[_self analyseTableData:object]];
        [_self refresh];
        [_self.progressHUD hide:YES];
        [_self.progressHUD removeFromSuperview];
    } failed:^(NSString *error) {
        mAlertView(@"提示", @"网络无法连接");
        [_self.progressHUD hide:YES];
        [_self.progressHUD removeFromSuperview];
    }];
}

- (NSArray *)analyseTableData:(id)object
{
    if ([object isKindOfClass:[NSArray class]]) {
        self.pageCount++;
        return object;
    } else if ([object isKindOfClass:[KSRespBase class]]) {
        self.data = object;

        if (self.data.message) {
            mAlertView(@"提示", self.data.message);
        }

        return nil;
    } else {
        return nil;
    }
}

- (void)loadMore
{
    WS(_self)
    [mKeyWindow addSubview : self.progressHUD];
    [self.progressHUD show:YES];
    [Singleton(KSRequest)requestDataWithParams:self.params Class:[self.data class] finished:^(id object) {
        [_tableView.tableItems addObjectsFromArray:[_self analyseTableData:object]];

        [_self refresh];
        [_self.progressHUD hide:YES];
        [_self.progressHUD removeFromSuperview];
    } failed:^(NSString *error) {
        NSLog(@"网络问题");
        [_self.progressHUD hide:YES];
        [_self.progressHUD removeFromSuperview];
    }];
}

#pragma mark - Model Data Update

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