//
//  NSDictionary+json.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSDictionary+json.h"

@implementation NSDictionary (json)
- (NSString *)toJsonString {
    NSString *jsonString = nil;
    NSError  *error;
    NSData   *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
@end
