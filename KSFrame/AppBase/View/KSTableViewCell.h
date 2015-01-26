//
//  KSTableViewCell.h
//  KSFrame
//
//  Created by JoyTouch9 on 15-1-16.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSTableViewCell : UITableViewCell
@property (nonatomic, retain, readonly) UIView *cellView;

- (void)drawContentView:(CGRect)rect;
- (CGRect)cellViewFrame;
@end
