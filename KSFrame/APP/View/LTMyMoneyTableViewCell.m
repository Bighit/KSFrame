//
//  LTMyMoneyTableViewCell.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-4.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyMoneyTableViewCell.h"

@implementation LTMyMoneyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellViewWithContent:(LTuserPayList *)content
{
    if ([content.inout isEqualToString:@"1"]) {
        [self.lblMoney setText:[NSString stringWithFormat:@"-%@",content.paymoney]];
    }else
    {
        [self.lblMoney setText:content.paymoney];
    }
    [self.lblTime setText:[[content.addtime substringFromIndex:2] substringToIndex:14]];
    [self.lblType setText:content.type];
    
    [self.lblRestMoney setText:content.money];

}
@end
