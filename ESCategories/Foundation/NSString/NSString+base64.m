//
//  NSString+base64.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+base64.h"

@implementation NSString (base64)

- (NSString *)base64Encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Encode = [data base64EncodedStringWithOptions:0];
    return base64Encode;
}

- (NSString *)base64Decode {
    NSData *dataFromBase64String = [[NSData alloc] initWithBase64EncodedString:self options:0];
    NSString *base64Decode = [[NSString alloc] initWithData:dataFromBase64String encoding:NSUTF8StringEncoding];
    return base64Decode;
}

@end
