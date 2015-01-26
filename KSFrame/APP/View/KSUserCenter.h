//
//  KSUserCenter.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSTableView.h"
@interface KSUserCenter : UIView
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UIButton *btnMyLottery;
@property (weak, nonatomic) IBOutlet UIButton *btnMyMoney;
@property (weak, nonatomic) IBOutlet UIButton *btnMyRed;
@property (weak, nonatomic) IBOutlet UIButton *btnRecharge;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginOut;
@property (weak, nonatomic) IBOutlet KSTableView *userTableView;
@end
