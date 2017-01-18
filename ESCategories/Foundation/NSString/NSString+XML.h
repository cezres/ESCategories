//
//  NSString+XML.h
//  Categories
//
//  Created by fengjiwen on 16/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XML)

// 将 &lt 等类似的字符转化为的“<”等
- (NSString *)removeXML;

@end
