//
//  LTMyMoneyTableViewCell.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-4.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTuserPayList.h"
@interface LTMyMoneyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblRestMoney;
- (void)setCellViewWithContent:(LTuserPayList *)content;
@end
