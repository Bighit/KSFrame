//
//  LTMyLotteryTableViewCell.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTMyLotteryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgViewStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

@end
