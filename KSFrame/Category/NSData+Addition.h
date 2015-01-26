//
//  NSData+Addition.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-11.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Addition)
/**
 *  归档
 *
 *  @param object <#object description#>
 *
 *  @return <#return value description#>
 */
- (NSData *)dataWithObject:(id)object;
/**
 *  解归档
 *
 *  @return <#return value description#>
 */
- (id)convertDataToObject;
/**
 *  base64加密 返回字符串
 *
 *  @return <#return value description#>
 */
- (NSString *)base64Encoding;

/**
 *  根据data返回图片的类型
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)contentTypeForImageData:(NSData *)data;
/**
 *  base64加密 把字符串加密 返回id
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+ (id)dataWithBase64EncodedString:(NSString *)string;     //  Padding '=' characters are optional. Whitespace is ignored.

@end