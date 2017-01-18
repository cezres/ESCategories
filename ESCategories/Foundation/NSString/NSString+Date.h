//
//  NSString+Date.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

// 例如：（小时:分钟） （刚刚） （几分钟前）
- (NSString *)interval;

// 例如：（25四月）（今天）（昨天）
- (NSString *)intdata;

// 例如：（月份:日） （刚刚）（几分钟前）
- (NSString *)intCdate;

// 例如：（今天 下午1:30）
- (NSString *)intPAdate;

// 时间转化
- (NSTimeInterval)dateConverter;

@end
