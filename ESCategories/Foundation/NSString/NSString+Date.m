//
//  NSString+Date.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSString *)interval {
    NSString *timeString = @"";
    NSInteger iMinutes = ([self secondTime]/60) % 60;
    NSInteger iHours = labs([self secondTime]/3600);
    NSInteger iDays = [self secondTime]/60/60/24;
    if (iMinutes < 10 && iMinutes >= 0 && iDays == 0 && iHours == 0) {
        timeString=@"刚刚";
    }
    else if (iHours < 1 && iMinutes >= 10 && iDays == 0) {
        timeString = [NSString stringWithFormat:@"%ld分前",iMinutes];
    }
    else {
        if (self.length >=16) {
            timeString = [self substringWithRange:NSMakeRange(11,5)];
        }
    }
    return timeString;
}

- (NSString *)intdata {
    NSString *timeString = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    if (self.length < 10) {
        return @"";
    }
    NSString *nowString = [formatter stringFromDate:nowDate];
    NSString *beginString = [nowString substringWithRange:NSMakeRange(0,10)];
    NSString *endString = [self substringWithRange:NSMakeRange(0,10)];
    NSString *monthString = [nowString substringWithRange:NSMakeRange(0,8)];
    NSString *endMonthString = [self substringWithRange:NSMakeRange(0,8)];
    NSString *todayString = [nowString substringWithRange:NSMakeRange(8,2)];
    NSString *enddayString = [self substringWithRange:NSMakeRange(8,2)];
    if ([beginString isEqualToString:endString]) {
        timeString=@"今天";
    }
    else if ([monthString isEqualToString:endMonthString]&&[todayString integerValue]-[enddayString integerValue] == 1) {
        timeString=@"昨天";
        
    }else {
        if (self.length >= 11) {
            NSString *MString = [self substringWithRange:NSMakeRange(5,2)];
            NSString *mstr    = [MString arabicNumeralsToChinese:MString.intValue];
            NSString *mstring = [NSString stringWithFormat:@"%@月",mstr];
            NSString *DString = [self substringWithRange:NSMakeRange(8,2)];
            timeString = [NSString stringWithFormat:@"%@%@",DString,mstring];
        }
    }
    return timeString;
}

- (NSString *)intCdate {
    NSString *timeString = @"";
    NSInteger iMinutes = ([self secondTime]/60) % 60;
    NSInteger iHours = labs([self secondTime]/3600);
    NSInteger iDays = [self secondTime]/60/60/24;
    if (iMinutes < 10 && iMinutes >= 0 && iDays == 0 && iHours == 0) {
        timeString=@"刚刚";
    }
    else if (iHours < 1 && iMinutes >= 10 && iDays == 0) {
        timeString=[NSString stringWithFormat:@"%ld分前",iMinutes];
    }
    else if (iHours > 1 && iDays < 1) {
        timeString=[NSString stringWithFormat:@"%ld小时之前",iHours];
    }
    else if (iDays == 1&&iDays<2) {
        timeString = [NSString stringWithFormat:@"%ld天之前",iDays];
    }else if (iDays >= 2) {
        
        timeString = [self substringWithRange:NSMakeRange(5,5)];
    }
    else {
        timeString=@"刚刚";
    }
    return timeString;
}

- (NSString *)intPAdate {
    NSString *timeString = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    if (self.length < 16) {
        return @"";
    }
    // 截取字符串
    NSString *nowString = [formatter stringFromDate:nowDate];
    NSString *beginString = [nowString substringWithRange:NSMakeRange(0,10)];
    NSString *endString = [self substringWithRange:NSMakeRange(0,10)];
    NSString *monthString = [nowString substringWithRange:NSMakeRange(0,8)];
    NSString *endMonthString = [self substringWithRange:NSMakeRange(0,8)];
    NSString *todayString = [nowString substringWithRange:NSMakeRange(8,2)];
    NSString *enddayString = [self substringWithRange:NSMakeRange(8,2)];
    NSString *minutes = [self substringWithRange:NSMakeRange(13,3)];
    NSString *hours = [self substringWithRange:NSMakeRange(11,2)];
    
    //相差分钟，小时，天
    NSInteger iMinutes = ([self secondTime]/60) % 60;
    NSInteger iHours = labs([self secondTime]/3600);
    NSInteger iDays = [self secondTime]/60/60/24;
    
    if ([beginString isEqualToString:endString]) {
        if (iMinutes < 10 && iMinutes >= 0 && iDays == 0 && iHours == 0) {
            timeString=@"刚刚";
        }
        else {
            if([hours integerValue] >12) {
                NSInteger a = [hours integerValue] - 12;
                timeString = [NSString stringWithFormat:@"今天 下午%ld%@",a,minutes];
            }
            else if ([hours integerValue] == 12) {
                timeString = [NSString stringWithFormat:@"今天 下午%@%@",hours,minutes];
            }
            else {
                timeString = [NSString stringWithFormat:@"今天 上午%@%@",hours,minutes];
            }
        }
    }
    else if ([monthString isEqualToString:endMonthString] && [todayString integerValue]-[enddayString integerValue] == 1) {
        if([hours integerValue] >12) {
            NSInteger a = [hours integerValue] - 12;
            timeString = [NSString stringWithFormat:@"昨天 下午%ld%@",a,minutes];
        }
        else if ([hours integerValue] == 12) {
            timeString = [NSString stringWithFormat:@"昨天 下午%@%@",hours,minutes];
        }
        else {
            timeString = [NSString stringWithFormat:@"昨天 上午%@%@",hours,minutes];
        }
        
    }
    else {
        NSString *MString = [self substringWithRange:NSMakeRange(5,2)];
        NSString *mstring = [NSString stringWithFormat:@"%ld月",[MString integerValue]];
        NSString *DString = [self substringWithRange:NSMakeRange(8,2)];
        NSString *dstring = [NSString stringWithFormat:@"%ld日",[DString integerValue]];
        if([hours integerValue] >12) {
            NSInteger a = [hours integerValue] - 12;
            timeString = [NSString stringWithFormat:@"%@%@ 下午%ld%@",mstring,dstring,a,minutes];
        }
        else if ([hours integerValue] == 12) {
            timeString = [NSString stringWithFormat:@"%@%@ 上午%@%@",mstring,dstring,hours,minutes];
        }
        else {
            timeString = [NSString stringWithFormat:@"%@%@ 下午%@%@",mstring,dstring,hours,minutes];
        }
    }
    return timeString;
}

// 获取相差多少秒
- (long)secondTime {
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:self];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    
    //获取当前时间
    NSDate *adate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: adate];
    NSDate *localeDate = [adate  dateByAddingTimeInterval: interval];
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    long secondTime = labs((long)intervalTime);
    return secondTime;
}

- (NSTimeInterval) dateConverter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm:ss"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:self];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}
// 数字转成大写
-(NSString *)arabicNumeralsToChinese:(int)number {
    switch (number) {
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"七";
            break;
        case 8:
            return @"八";
            break;
        case 9:
            return @"九";
            break;
        case 10:
            return @"十";
            break;
        case 11:
            return @"十一";
            break;
        case 12:
            return @"十二";
            break;
        default:
            return nil;
            break;
    }
}
@end
