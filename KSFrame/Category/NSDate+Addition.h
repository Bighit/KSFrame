//
//  NSDate+Addition.h
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-11.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

/**
 *  将日期转化为字符串。
 *  @param  format:转化格式，形如@"yyyy年MM月dd日hh时mm分ss秒"。
 *  return  返回转化后的字符串。
 */
- (NSString *)convertDateToStringWithFormat:(NSString *)format;

/**
 *  将字符串转化为日期。
 *  @param  string:给定的字符串日期。
 *  @param  format:转化格式，形如@"yyyy年MM月dd日hh时mm分ss秒"。日期格式要和string格式一致，否则会为空。
 *  return  返回转化后的日期。
 */
- (NSDate *)convertStringToDate:(NSString *)string format:(NSString *)format;
- (NSUInteger)daysAgo;
- (NSUInteger)daysAgoAgainstMidnight;
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
- (NSUInteger)weekday;
- (NSString *)chineseWeekDay;       // by chc
- (NSString *)timeIntervalSinceNow; // by chc

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime;

- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;
@end