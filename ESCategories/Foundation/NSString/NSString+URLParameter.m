//
//  NSString+URLParameter.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+URLParameter.h"

@implementation NSString (URLParameter)

- (NSDictionary *)URLParameter {
    NSArray *array = [self componentsSeparatedByString:@"?"];
    if ([array count] != 2) {
        return @{};
    }
    array = [array[1] componentsSeparatedByString:@"&"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSString *string in array) {
        NSArray *keyvalue = [string componentsSeparatedByString:@"="];
        if ([keyvalue count] < 2) {
            continue;
        }
        [dict setObject:keyvalue[1] forKey:keyvalue[0]];
    }
    return dict;
}


- (NSString *)insertURLParameter:(NSDictionary *)dict {
    NSString *string;
    for (NSString *key in dict.allKeys) {
        if (string) {
            string = [string stringByAppendingFormat:@"%@&%@=%@", string, key, dict[key]];
        }
        else {
            string = [NSString stringWithFormat:@"%@=%@", key, dict[key]];
        }
    }
    
    if (!string) {
        return self;
    }
    
    if ([self rangeOfString:@"?"].length > 0) {
        return [NSString stringWithFormat:@"%@&%@", self, string];
    }
    else {
        return [NSString stringWithFormat:@"%@?%@", self, string];
    }
    
}
@end
