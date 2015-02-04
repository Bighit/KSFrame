//
//  LTMyJoinedTableViewCell.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyJoinedTableViewCell.h"

@implementation LTMyJoinedTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellViewWithContent:(LTphoneMyHemai *)content
{
    [self.lblType setText:content.type];
    [self.lblMoney setText:[NSString stringWithFormat:@"跟单：%@元", content.mymoney]];
    [self.lblBonus setText:[NSString stringWithFormat:@"中奖：%@元", content.prize]];
    [self.lblTime setText:[[NSDate dateWithTimeIntervalSince1970:[content.time doubleValue] / 1000] stringWithFormat:@"yyyy-MM-dd hh:mm"]];
    [self.lblTotal setText:[NSString stringWithFormat:@"共：%@元", content.total]];
    [self.lblUser setText:content.author];
}

@end