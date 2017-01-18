//
//  NSString+RMB.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+RMB.h"

@implementation NSString (RMB)

- (NSString *)RMB {
    if ([self doubleValue] == [self integerValue]) {
        return [NSString stringWithFormat:@"¥ %ld", (long)[self integerValue]];
    }
   return [self sameCode];
}

- (NSString *)RMBHasFractional {
    return [self sameCode];
}

- (NSString *)NoRMBSign {
    NSMutableString *mutableString = [NSMutableString stringWithString:[self sameCode]];
    [mutableString deleteCharactersInRange:NSMakeRange(0, 1)];
    NSString *newString = [NSString stringWithFormat:@"%@",mutableString];
    return newString;
}
// 相同代码块
- (NSString *)sameCode {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    NSRange range = [mutableString rangeOfString:@"."];
    NSInteger index = mutableString.length;
    if (range.length > 0) {
        if (index - range.location == 2) {
            [mutableString appendString:@"0"];
        }
        else if (index - range.location > 3) {
            [mutableString deleteCharactersInRange:NSMakeRange(range.location + 3, index - range.location - 3)];
        }
        index = range.location - 3;
    }
    else {
        index -= 3;
        [mutableString appendString:@".00"];
    }
    while (index > 0) {
        [mutableString insertString:@"," atIndex:index];
        index -= 3;
    }
    return [NSString stringWithFormat:@"¥ %@", mutableString];
}

@end
