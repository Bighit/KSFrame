//
//  UIButton+Addtion.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-26.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "UIButton+Addtion.h"
#undef	NAV_BUTTON_MIN_WIDTH
#define	NAV_BUTTON_MIN_WIDTH	(40.0f)

#undef	NAV_BUTTON_MIN_HEIGHT
#define	NAV_BUTTON_MIN_HEIGHT	(40.0f)
@implementation UIButton (Addtion)
-(UIButton *)initNavigationButton:(UIImage *)image{
    CGRect buttonFrame = CGRectZero;
    
    if (mSystemVersion>=7)
    {
        buttonFrame = CGRectMake(0, 0, image.size.width, mNavBarHeight);
    }
    else
    {
        buttonFrame = CGRectMake(0, 0, image.size.width + 10.0f, mNavBarHeight);
    }
    if ( buttonFrame.size.width >= NAV_BUTTON_MIN_WIDTH )
    {
        buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH;
    }
    
    if ( buttonFrame.size.height >= NAV_BUTTON_MIN_HEIGHT )
    {
        buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT;
    }
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    [self setImage:image forState:UIControlStateNormal];
    return self;
}
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color{
    CGRect buttonFrame = CGRectZero;
    
    CGSize titleSize = [str sizeWithFont:[UIFont boldSystemFontOfSize:16.0f]
                       constrainedToSize:CGSizeMake(999999.0f, mNavBarHeight)];
    
    if (mSystemVersion>=7)
    {
        buttonFrame = CGRectMake(0, 0, titleSize.width, mNavBarHeight);
    }
    else
    {
        buttonFrame = CGRectMake(0, 0, titleSize.width + 10.0f, mNavBarHeight);
    }
    
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitle:str forState:UIControlStateNormal];
    return self;
}
@end
