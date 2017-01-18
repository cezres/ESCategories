//
//  UITextView+Placeholder.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

/// 占位字符串
@property (strong, nonatomic) NSString *placeholder;

/// 占位字符串标签
@property (strong, nonatomic, readonly) UILabel *placeholderLabel;

@end
