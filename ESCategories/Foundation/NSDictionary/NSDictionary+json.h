//
//  NSDictionary+json.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (json)
/**
 *  字典转json 字符串
 */
- (NSString *)toJsonString;
@end
