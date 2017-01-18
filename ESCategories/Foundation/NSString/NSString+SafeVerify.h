//
//  NSString+SafeVerify.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SafeVerify)

// 判断长度是否为0
- (BOOL)isValid;

// 判断内容是否全部为空格  yes 全部为空格  no 不是
- (BOOL)isEmpty;

// 判断用户输入的密码是否符合规范，符合规范的密码要求： 长度大于8位 密码中必须同时包含数字和字母
- (BOOL)judgePassWordLegal;

// 判断钱包密码是否有效  6位数包换数字，字符
- (BOOL)walletPWDValid;

// 根据正则表达式判断是否是正确的手机号
- (BOOL)isValidPhoneNumWithPredicate:(NSString *)predicate;

// 验证邮箱
- (BOOL)validateEmail;

// 验证手机号
- (BOOL)validatePhone;

// 判断是否包含中文
- (BOOL)includeChinese;

// 判断是否包含表情
- (BOOL)stringContainsEmoji;

// 是否全为数字
- (BOOL)isPureNumandCharacters;

// 支付流程不允许包含特殊字符
- (BOOL)checkPayChar;

@end
