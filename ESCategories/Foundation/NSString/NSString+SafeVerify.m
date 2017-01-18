//
//  NSString+SafeVerify.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+SafeVerify.h"

@implementation NSString (SafeVerify)

- (BOOL)isValid {
    if (self.length == 0) {
        return NO;
    }
    return YES;
}

- (BOOL)isEmpty {
    if (!self) {
        return true;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
    return [trimedString length] == 0;
}

- (BOOL)judgePassWordLegal {
    BOOL result = false;
    if ([self length] >= 8 && [self length] <= 20){
        // 判断长度大于6位后再接着判断是否同时包含数字和字符
        //        NSString * regex = @"(?!^\\d+$)(?!^[a-zA-Z]+$)[a-zA-Z0-9]{8,20}";//@"^(?![0-9]+$)(?![a-zA-Z]+$).{8,20}$"; //
        //        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        //        result = [pred evaluateWithObject:self];
        result = YES;
    }
    return result;
}

- (BOOL)walletPWDValid {
    BOOL result = false;
    if ([self length] >= 8) {
        // 判断长度大于6位后再接着判断是否同时包含数字和字符
        NSString * regex = @"(?!^\\d+$)(?!^[a-zA-Z]+$)[a-zA-Z0-9]{8,20}";//@"^(?![0-9]+$)(?![a-zA-Z]+$).{8,20}$"; //
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:self];
        
    }
    return result;
}


- (BOOL)isValidPhoneNumWithPredicate:(NSString *)predicate {
    if (predicate.length == 0 || !predicate) {
        return NO;
    }
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicate];
    BOOL result = [pred evaluateWithObject:self];
    return result;
}

- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)validatePhone {
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)includeChinese {
    for(int i=0; i< [self length];i++) {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff) {
            return YES;
            
        }
    }
    return NO;
}

- (BOOL)stringContainsEmoji {
    __block BOOL returnValue =NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        
        if (0xd800) {
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        returnValue =YES;
                    }
                }
            }else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    returnValue =YES;
                }
            }else {
                if (0x2100 <= hs && hs <= 0x27ff) {
                    returnValue =YES;
                }
                else if (0x2B05 <= hs && hs <= 0x2b07) {
                    returnValue =YES;
                }
                else if (0x2934 <= hs && hs <= 0x2935) {
                    returnValue =YES;
                }
                else if (0x3297 <= hs && hs <= 0x3299) {
                    returnValue =YES;
                }
                else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                    returnValue =YES;
                }
            }
        }
    }];
    return returnValue;
}

- (BOOL)isPureNumandCharacters {
    NSString *string = [self  stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0) {
        return NO;
    }
    return YES;
}

- (BOOL)checkPayChar {
    NSString *regex = @"[a-z A-Z 0-9 , . + - - — / ! @ # $ % ^ & * ( ) _ = ? \u4e00-\u9fa5 ， 。 ？]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

@end
