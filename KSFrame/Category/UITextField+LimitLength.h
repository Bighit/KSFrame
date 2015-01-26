//
//  UITextField+LimitLength.h
//  TextLengthLimitDemo
//
//  Created by Su XinDe on 13-4-8.
//  Copyright (c) 2013年 Su XinDe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitLength)
/**
 *  限制textfield输入字符的长度，
 *
 *  @param length 6代表6个字母 或 3个汉字
 */
- (void)limitTextLength:(int)length;

@end
