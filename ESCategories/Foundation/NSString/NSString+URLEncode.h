//
//  NSString+URLEncode.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncode)

// 编码
@property (assign ,nonatomic,readonly) NSString *URLEncode;

// 解码
@property (assign ,nonatomic,readonly) NSString *URLDeCode;

@end
