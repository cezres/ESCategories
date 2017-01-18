//
//  NSString+XML.m
//  Categories
//
//  Created by fengjiwen on 16/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+XML.h"

@implementation NSString (XML)

- (NSString *)removeXML {
    NSMutableString *muStr = [[NSMutableString alloc]initWithString:self];
    NSString *str =  [muStr stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    str = [str stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    str = [str stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    str = [str stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    return str;
}

@end
