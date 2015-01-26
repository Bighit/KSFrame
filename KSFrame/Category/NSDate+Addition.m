//
//  NSDate+Addition.m
//  KSFrame
//
//  Created by JoyTouch9 on 14-12-11.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

- (NSString *)convertDateToStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

- (NSDate *)convertStringToDate:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

/*
 * This guy can be a little unreliable and produce unexpected results,
 * you're better off using daysAgoAgainstMidnight
 */
- (NSUInteger)daysAgo
{
    NSCalendar          *calendar = [NSCalendar currentCalendar];
    NSDateComponents    *components = [calendar components:(NSDayCalendarUnit)
        fromDate:self
        toDate  :[NSDate date]
        options :0];

    return [components day];
}

- (NSUInteger)daysAgoAgainstMidnight
{
    // get a midnight version of ourself:
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];

    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];

    return (int)[midnight timeIntervalSinceNow] / (60 * 60 * 24) * -1;
}

- (NSString *)stringDaysAgo
{
    return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag
{
    NSUInteger  daysAgo = (flag) ?[self daysAgoAgainstMidnight] :[self daysAgo];
    NSString    *text = nil;

    switch (daysAgo) {
        case 0:
            text = @"Today";
            break;

        case 1:
            text = @"Yesterday";
            break;

        default:
            text = [NSString stringWithFormat:@"%lu days ago", (unsigned long)daysAgo];
    }
    return text;
}

- (NSUInteger)weekday
{
    NSCalendar          *calendar = [NSCalendar currentCalendar];
    NSDateComponents    *weekdayComponents = [calendar components:(NSWeekdayCalendarUnit) fromDate:self];

    return [weekdayComponents weekday];
}

- (NSString *)chineseWeekDay
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //  通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUnit等）
    NSDateComponents *dateComponents = [greCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit fromDate:self];

    NSLog(@"weekday(星期):%li", (long)dateComponents.weekday);

    NSString *week = nil;
    switch (dateComponents.weekday) {
        case 1:
            week = @"星期日";
            break;

        case 2:
            week = @"星期一";
            break;

        case 3:
            week = @"星期二";
            break;

        case 4:
            week = @"星期三";
            break;

        case 5:
            week = @"星期四";
            break;

        case 6:
            week = @"星期五";
            break;

        case 7:
            week = @"星期六";
            break;

        default:
            break;
    }

    return week;
}

- (NSString *)timeIntervalSinceNow
{
    NSDate          *nowDate = [NSDate date];
    NSTimeInterval  interval = [self timeIntervalSinceDate:nowDate];
    int             hour = interval / 3600;
    int             min = (interval - hour * 3600) / 60;
    NSString        *str = nil;

    if (hour == 0) {
        str = [NSString stringWithFormat:@"%d分钟", min];
    } else {
        str = [NSString stringWithFormat:@"%d小时%d分钟", hour, min];
    }

    return str;
}

+ (NSDate *)dateFromString:(NSString *)string
{
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];

    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime
{
    /*
     * if the date is in today, display 12-hour time with meridian,
     * if it is within the last 7 days, display weekday name (Friday)
     * if within the calendar year, display as Jan 23
     * else display as Nov 11, 2008
     */
    NSCalendar      *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];

    NSDate              *today = [NSDate date];
    NSDateComponents    *offsetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
        fromDate:today];

    NSDate      *midnight = [calendar dateFromComponents:offsetComponents];
    NSString    *displayString = nil;

    // comparing against midnight
    NSComparisonResult midnight_result = [date compare:midnight];

    if (midnight_result == NSOrderedDescending) {
        if (prefixed) {
            [displayFormatter setDateFormat:@"'at' h:mm a"];    // at 11:30 am
        } else {
            [displayFormatter setDateFormat:@"h:mm a"];         // 11:30 am
        }
    } else {
        // check if date is within last 7 days
        NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
        [componentsToSubtract setDay:-7];
        NSDate              *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
        NSComparisonResult  lastweek_result = [date compare:lastweek];

        if (lastweek_result == NSOrderedDescending) {
            if (displayTime) {
                [displayFormatter setDateFormat:@"EEEE h:mm a"];
            } else {
                [displayFormatter setDateFormat:@"EEEE"]; // Tuesday
            }
        } else {
            // check if same calendar year
            NSInteger thisYear = [offsetComponents year];

            NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                fromDate:date];
            NSInteger thatYear = [dateComponents year];

            if (thatYear >= thisYear) {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d h:mm a"];
                } else {
                    [displayFormatter setDateFormat:@"MMM d"];
                }
            } else {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d, yyyy h:mm a"];
                } else {
                    [displayFormatter setDateFormat:@"MMM d, yyyy"];
                }
            }
        }

        if (prefixed) {
            NSString    *dateFormat = [displayFormatter dateFormat];
            NSString    *prefix = @"'on' ";
            [displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
        }
    }

    // use display formatter to return formatted date string
    displayString = [displayFormatter stringFromDate:date];

    return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed
{
    return [[self class] stringForDisplayFromDate:date prefixed:prefixed alwaysDisplayTime:NO];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date
{
    return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];

    [outputFormatter setDateFormat:format];
    NSString *timestamp_str = [outputFormatter stringFromDate:self];
    return timestamp_str;
}

- (NSString *)string
{
    return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];

    [outputFormatter setDateStyle:dateStyle];
    [outputFormatter setTimeStyle:timeStyle];
    NSString *outputString = [outputFormatter stringFromDate:self];
    return outputString;
}

- (NSDate *)beginningOfWeek
{
    // largely borrowed from "Date and Time Programming Guide for Cocoa"
    // we'll use the default calendar and hope for the best
    NSCalendar  *calendar = [NSCalendar currentCalendar];
    NSDate      *beginningOfWeek = nil;
    BOOL        ok = [calendar  rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek
                                interval:NULL forDate:self];

    if (ok) {
        return beginningOfWeek;
    }

    // couldn't calc via range, so try to grab Sunday, assuming gregorian style
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];

    /*
     *   Create a date components to represent the number of days to subtract from the current date.
     *   The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
     */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay:0 - ([weekdayComponents weekday] - 1)];
    beginningOfWeek = nil;
    beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];

    // normalize to midnight, extract the year, month, and day components and create a new date from those components.
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
        fromDate:beginningOfWeek];
    return [calendar dateFromComponents:components];
}

- (NSDate *)beginningOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
        fromDate:self];

    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents    *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents    *componentsToAdd = [[NSDateComponents alloc] init];

    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:(7 - [weekdayComponents weekday])];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];

    return endOfWeek;
}

+ (NSString *)dateFormatString
{
    return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString
{
    return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString
{
    return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString
{
    return [NSDate timestampFormatString];
}

@end