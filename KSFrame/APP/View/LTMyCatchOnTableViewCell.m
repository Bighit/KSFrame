//
//  LTMyCatchOnTableViewCell.m
//  KSFrame
//
//  Created by JoyTouch9 on 15-2-3.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "LTMyCatchOnTableViewCell.h"

@implementation LTMyCatchOnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellViewWithContent:(LTuserTraceList *)content
{
    [self.lblStart setText:[NSString stringWithFormat:@"第%@期",content.start]];
    [self.lblMoney setText:[NSString stringWithFormat:@"总金额：%@元", content.totalmoney]];
    [self.lblTotal setText:[NSString stringWithFormat:@"共追%@期", content.totalcount]];
    [self.lblResult setText:content.status];
    [self.lblTerms setText:[NSString stringWithFormat:@"已追%@期", content.finishcount]];
}
@end
