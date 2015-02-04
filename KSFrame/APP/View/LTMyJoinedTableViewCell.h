//
//  LTMyJoinedTableViewCell.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTphoneMyHemai.h"
@interface LTMyJoinedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblUser;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblBonus;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
-(void)setCellViewWithContent:(LTphoneMyHemai *)content;
@end
