//
//  NVDate.h
//
//  Created by Noval Agung Prayogo on 2/5/14.
//  Copyright (c) 2014 Noval Agung Prayogo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, NVDayUnit) {
    NVDayUnitSunday    = 1,
    NVDayUnitMonday    = 2,
    NVDayUnitTuesday   = 3,
    NVDayUnitWednesday = 4,
    NVDayUnitThursday  = 5,
    NVDayUnitFriday    = 6,
    NVDayUnitSaturday  = 7
    
};

typedef NS_OPTIONS(NSUInteger, NVMonthUnit) {
    NVMonthUnitJanuary   = 1,
    NVMonthUnitFebruary  = 2,
    NVMonthUnitMarch     = 3,
    NVMonthUnitApril     = 4,
    NVMonthUnitMay       = 5,
    NVMonthUnitJune      = 6,
    NVMonthUnitJuly      = 7,
    NVMonthUnitAugust    = 8,
    NVMonthUnitSeptember = 9,
    NVMonthUnitOctober   = 10,
    NVMonthUnitNovember  = 11,
    NVMonthUnitDecember  = 12,
};

@interface NVDate : NSObject
/**
 *  初始化获取系统当前时间
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingToday;
/**
 *  初始化 获取指定的date时间
 *
 *  @param date 指定date
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingDate:(NSDate *)date;
/**
 *  给定日期 初始化NSDate
 *
 *  @param year  2014
 *  @param month 12
 *  @param day   1
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
/**
 *  给定日期和时间 初始化NSDate
 *
 *  @param year   2015
 *  @param month  1
 *  @param day    15
 *  @param hour   12
 *  @param minute 18
 *  @param second 50
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
/**
 *  给定日期字符串转换NSdate
 *
 *  @param stringDate 形如@"2014-12-01日12-00-00"或者@"2014年12月01日12时00分00秒"字符串
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingString:(NSString *)stringDate;
/**
 *   给定日期字符串转换NSdate 并指定日期的格式
 *
 *  @param stringDate 形如@"2014-12-01日12-00-00"字符串

 *  @param dateFormat 指定日期的格式@"2014年12月01日12时00分00秒"或@"2014-12-01日12-00-00"或者
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingString:(NSString *)stringDate withFormat:(NSString *)dateFormat;
/**
 *  使用秒 创建NSdate (从1970年01月01日08时00分00秒算起)
 *
 *  @param seconds 秒数
 *
 *  @return NSDate类型的时间
 */
- (id)initUsingSeconds:(NSInteger)seconds;

- (NSDate *)date;
/**
 *  NVdate 转换成字符串形如 1970年01月01日08时00分00秒
 *
 *  @return 返回字符串
 */
- (NSString *)stringValueWithSystem;
/**
 *  NVdate 转换成字符串 @"yyyy-MM-dd HH:mm:ss" 任意位置
 *
 *  @param dateFormat 转换字符串的格式
 *
 *  @return 返回日期字符串
 */
- (NSString *)stringValueWithFormat:(NSString *)dateFormat;
/**
 *  把日期 化成当天12点
 */
- (void)zeroTime;
/**
 *  日期的前一天
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousDay;
/**
 *  指定日期的前 几 天
 *
 *  @param days 设定提前日期。
 *
 *  @return  NSDate类型的时间
 */
- (instancetype)previousDays:(NSInteger)days;
/**
 *  日期的后一天
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextDay;
/**
 *  指定日期的后 几 天
 *
 *  @param days 设定延后时间。
 *
 *  @return  NSDate类型的时间
 */
- (instancetype)nextDays:(NSInteger)days;
/**
 *  提前一周
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousWeek;
/**
 *  提前几周
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousWeeks:(NSInteger)weeks;
/**
 *  延后一周
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextWeek;
/**
 *  延后几周
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextWeeks:(NSInteger)weeks;
/**
 *  提前一个月
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousMonth;
/**
 *  提前几个月
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousMonths:(NSInteger)months;
/**
 *  延后一个月
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextMonth;
/**
 *  延后几个月
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextMonths:(NSInteger)months;
/**
 *  提前一年
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousYear;
/**
 *  提前几年
 *
 *  @return NSDate类型的时间
 */
- (instancetype)previousYears:(NSInteger)years;
/**
 *  延后一年
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextYear;
/**
 *  延后几年
 *
 *  @return NSDate类型的时间
 */
- (instancetype)nextYears:(NSInteger)years;
/**
 *  当前月份的第一天
 *
 *  @return  NSDate类型的时间
 */
- (instancetype)firstDayOfMonth;
/**
 *  当前月份的最后一天
 *
 *  @return  NSDate类型的时间
 */
- (instancetype)lastDayOfMonth;

/**
 *  当前年份的第一个月
 *
 *  @return NSDate类型的时间
 */
- (instancetype)firstMonthOfYear;
/**
 *  当前年份的最后月份
 *
 *  @return NSDate类型的时间
 */
- (instancetype)lastMonthOfYear;
/**
 *  以当前日期为分界 前七天 星期对应的日期
 *
 *  @param dayUnit <#dayUnit description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)previousDayOfDayName:(NVDayUnit)dayUnit;
/**
 *  以当前日期为分界 后七天 星期对应的日期
 *
 *  @param dayUnit <#dayUnit description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)nextDayOfDayName:(NVDayUnit)dayUnit;
/**
 *  判断日期是周几
 *
 *  @param dayUnit <#dayUnit description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isCurrentDayName:(NVDayUnit)dayUnit;
/**
 *  判断日期的月份
 *
 *  @param monthUnit <#monthUnit description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isCurrentMonthName:(NVMonthUnit)monthUnit;

/**
 *  把日期转换成星期几
 *
 *  @param string 形如@"2015-01-14"
 *
 *  @return 2015年01月14日 星期三
 */
+(NSString *)dayDescFromDate:(NSString *)string;

@property NSString *dateFormatUsingString;
@property NSDateFormatterStyle dateFormatUsingStyle;
@property NSDateFormatterStyle timeFormatUsingStyle;
@property NSInteger year;
@property NSInteger month;
@property (readonly) NSInteger week;
@property NSInteger day;
@property NSInteger hour;
@property NSInteger minute;
@property NSInteger second;

@end
