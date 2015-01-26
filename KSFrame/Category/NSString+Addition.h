//
//  NSString+HW.h
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  计算字符串的 汉字 字数（空格和字母 两个算一个。）。
 *  @param  string:输入字符串。
 *  return  返回输入字符串的字数。
 */
- (int)wordsCount;

- (NSString *)URLDecodedString;
/**
 *  把字符串转成URL字符串
 *
 *  @return 返回字符串
 */
- (NSString *)URLEncodedString;
/**
 *  把URL字符串转成字符串
 *
 *  @return 返回字符串
 */
- (NSString *)encodeStringWithUTF8;


- (NSUInteger)byteLengthWithEncoding:(NSStringEncoding)encoding;
/**
 * 判断是否只包含空格的字符串。
 */
- (BOOL)isWhitespace;

/**
 * 判断字符串是空的或只包含空格。
 */
- (BOOL)isEmptyOrWhitespace;

\


/**
 *  检查字符串是否包含给定字符串同时允许您定义比较选项
 *
 *  @param string  要比较的字符串
 *  @param options options:(NSStringCompareOptions)
 传入 NSStringCompareOptions 枚举的值
 enum{
 NSCaseInsensitiveSearch = 1,//不区分大小写比较
 NSLiteralSearch = 2,//区分大小写比较
 NSBackwardsSearch = 4,//从字符串末尾开始搜索
 NSAnchoredSearch = 8,//搜索限制范围的字符串
 NSNumbericSearch = 64//按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt
 //以下定义高于 mac os 10.5 或者高于 iphone 2.0 可用
 ,
 NSDiacriticInsensitiveSearch = 128,//忽略 "-" 符号的比较
 NSWidthInsensitiveSearch = 256,//忽略字符串的长度，比较出结果
 NSForcedOrderingSearch = 512//忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者 NSOrderedDescending
 //以下定义高于 iphone 3.2 可用
 ,
 NSRegularExpressionSearch = 1024//只能应用于 rangeOfString:..., stringByReplacingOccurrencesOfString:...和 replaceOccurrencesOfString:... 方法。使用通用兼容的比较方法，如果设置此项，可以去掉 NSCaseInsensitiveSearch 和 NSAnchoredSearch
 }
 *
 *  @return <#return value description#>
 */
- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options;
@end
