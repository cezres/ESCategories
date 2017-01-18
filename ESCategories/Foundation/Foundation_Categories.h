//
//  Foundation_Categories.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#ifndef Foundation_Categories_h
#define Foundation_Categories_h

#pragma mark - NSString 

#import "NSString+MD5.h"    // md5
#import "NSString+Size.h"   // 计算文本尺寸
#import "NSString+RMB.h"    // 人民币格式
#import "NSString+Date.h"   // 时间格式
#import "NSString+base64.h"     // base64加密 解码
#import "NSString+URLEncode.h"  // 链接编码 解码
#import "NSString+URLParameter.h"   // 链接参数转化
#import "NSString+SafeVerify.h"    // 安全校验
#import "NSString+HTML.h"  // 去除html标签
#import "NSString+XML.h"   // 去除xml特殊字符

#pragma mark - NSObject

#import "NSObject+SwiizzleMethod.h" // 运行时替换方法

#pragma mark - NSDictionary
#import "NSDictionary+json.h" //字典转为字符串json



#endif /* Foundation_Categories_h */
