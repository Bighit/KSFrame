//
//  KSUserCenterViewController.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-30.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "KSUserCenterViewController.h"
#import "KSphoneLogin.h"
#import "LTMyLotteryViewController.h"
@implementation KSUserCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cellIentifier = @"userCenterTableViewCell";
    self.tableItems = [NSMutableArray arrayWithArray:@[@[@[@"实名认证", @"setting_shiming"], @[@"手机绑定", @"setting_shouji"], @[@"银行卡绑定", @"setting_yinhangka"], @[@"提现", @"setting_tixian"], @[@"修改密码", @"setting_xiugai"]], @[@[@"在线客服", @"setting_zaixian"], @[@"客服电话", @"setting_kefu"]]]];
    self.data = [[KSphoneLogin alloc]init];
    [self.params setDictionary:@{@"user":@"test_qiu", @"password":[@"123456" stringFromMD5], @"version":@"13"}] ;
    //
    self.viewWithXib = [KSUserCenter viewWithNib];
    [self.view addSubview:_viewWithXib];
    [_viewWithXib setBackgroundColor:mRGBColor(236, 236, 236)];
    WS(_self)
    [_viewWithXib mas_makeConstraints :^(MASConstraintMaker *make) {
        make.edges.equalTo(_self.view).with.insets(UIEdgeInsetsZero);
        make.height.mas_equalTo(_viewWithXib.height);
        make.width.equalTo(_self.view);
    }];
    [self setViewContentSize:_viewWithXib.frame.size];
    [self setTitleText:@"用户中心"];
    [self configureTableViewDataSource];
    [self configureTableViewDelegate];
    [_viewWithXib.userTableView setTableItems:self.tableItems];
    //
    [_viewWithXib.btnMyLottery addTarget:self action:@selector(btnLotteryClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - refresh pulldown
- (void)refresh
{
    [super refresh];
    KSphoneLogin *login = self.data;

    if (kRespVilid(login.status)) {
        [_viewWithXib.lblName setText:@"test_qiu"];
        [_viewWithXib.lblMoney setText:[NSString stringWithFormat:@"余额：%@", login.balance]];
    }
}

#pragma mark - Table DataSource && Delegate

- (void)configureTableViewDataSource
{
    //
    [_viewWithXib.userTableView initTableViewDataSource];
    WS(_self);
    [_viewWithXib.userTableView.tableDataSource setCellClassName:self.cellIentifier];
    [_viewWithXib.userTableView.tableDataSource setCellConfigureBlock:^(UITableViewCell *cell, id cellDatas, NSIndexPath *indexPath) {
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_self.cellIentifier];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            [cell.contentView setBackgroundColor:[UIColor colorWithPatternImage:mImageByPath(@"setting_CellBack", @"png")]];
        }

        NSArray *arr = cellDatas;
        [cell.textLabel setText:arr[0]];
        NSString *a = [NSString stringWithFormat:@"%@@2x", arr[1]];
        [cell.imageView setImage:mImageByPath(a, @"png")];
        return cell;
    }];
}

- (void)configureTableViewDelegate
{
    [_viewWithXib.userTableView initTableViewDelegate];
    [_viewWithXib.userTableView.tableDelegate setCellHeightBlock:^(NSIndexPath *indexPath)
    {
        // 加载cell 高度
        return 35.0;
    }];
    [_viewWithXib.userTableView.tableDelegate setSelectCellBlock:^(NSIndexPath *indexPath, id item)
    {
        // 点击cell时候触发的事件
    }];
    [_viewWithXib.userTableView.tableDelegate setHeaderViewConfigureBlock:^UIView *(UITableView *view, NSInteger section) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, view.width, 25)];

        if (section == 0) {
            UILabel *label = [[UILabel alloc]initWithFrame:headerView.frame];
            [headerView addSubview:label];
            [label setBackgroundColor:[UIColor  clearColor]];
            [label setText:@"我的信息"];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(headerView);
                make.size.equalTo(headerView);
            }];
        } else {
            UILabel *label = [[UILabel alloc]initWithFrame:headerView.frame];
            [headerView addSubview:label];
            [label setBackgroundColor:[UIColor  clearColor]];
            [label setText:@"联系我们"];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(headerView);
                make.size.equalTo(headerView);
            }];
        }
        return headerView;
    }];
}

#pragma mark - buttonclick
- (void)btnLotteryClicked:(UIButton *)sender
{
    LTMyLotteryViewController *viewController = [[LTMyLotteryViewController alloc]init];

    [self.navigationController pushViewController:viewController animated:YES];
}

@end