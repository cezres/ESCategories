//
//  NSString+Size.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

// 根据字体返回宽度
- (CGFloat)widthWithFont:(UIFont *)font height:(CGFloat)height;

// 根据字体返回高度
- (CGFloat)heightWithFont:(UIFont *)font Width:(CGFloat)width;

// 有行间距返回的高度  Spacing:行间距
- (CGFloat)heightWithFont:(UIFont *)font Width:(CGFloat)width RowHeight:(CGFloat)rowheight Spacing:(CGFloat)spacing;

@end
