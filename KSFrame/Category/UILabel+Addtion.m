//
//  UILabel+Addtion.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "UILabel+Addtion.h"

@implementation UILabel (Addtion)
//ios6 later
-(CGSize)autoSize{
    return [self.text boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
}
@end
