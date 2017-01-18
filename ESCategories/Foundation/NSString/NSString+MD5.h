//
//  NSString+MD5.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

// 返回大写MD5
@property (assign, nonatomic, readonly) NSString *MD5;

// 返回小写md5
@property (assign, nonatomic, readonly) NSString *md5;

@end
