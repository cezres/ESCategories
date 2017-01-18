//
//  NSString+URLParameter.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLParameter)

// 链接参数字典
- (NSDictionary *)URLParameter;

// 拼接链接
- (NSString *)insertURLParameter:(NSDictionary *)dict;

@end
