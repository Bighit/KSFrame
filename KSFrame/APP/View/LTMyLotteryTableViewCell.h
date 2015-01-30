//
//  LTMyLotteryTableViewCell.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-26.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSTableViewCell.h"
@interface LTMyLotteryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblLotteryType;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

@end
