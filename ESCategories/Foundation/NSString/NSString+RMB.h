//
//  NSString+RMB.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RMB)

// 整数金额包含小数
- (NSString *)RMBHasFractional;

// 整数金额不包含小数
- (NSString *)RMB;

// 不包含人民币符号
- (NSString *)NoRMBSign;
@end
