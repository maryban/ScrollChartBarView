//
//  TimeUtil.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil
#pragma mark 获得当前年份
+(NSInteger)getYear
{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    NSInteger year = [dateComponent year];
    return year;
}
+(NSInteger)getMonth
{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    NSInteger month = [dateComponent month];
    return month;
}
+ (int)daysForMonth:(int)month year:(int)year
{
    // month is 0-based
    
    if (month == 1)
    {
        BOOL is29Feb = NO;
        
        if (year < 1582)
        {
            is29Feb = (year < 1 ? year + 1 : year) % 4 == 0;
        }
        else if (year > 1582)
        {
            is29Feb = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
        }
        
        return is29Feb ? 29 : 28;
    }
    
    if (month == 3 || month == 5 || month == 8 || month == 10)
    {
        return 30;
    }
    
    return 31;
}
@end
