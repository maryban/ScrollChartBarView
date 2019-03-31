//
//  TimeUtil.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeUtil : NSObject


+(NSInteger)getYear;
+(NSInteger)getMonth;
+ (int)daysForMonth:(int)month year:(int)year;
@end

NS_ASSUME_NONNULL_END
