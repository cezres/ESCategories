//
//  NSString+Size.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)widthWithFont:(UIFont *)font height:(CGFloat)height {
    CGSize maxSize = CGSizeMake(9999, height);
    return [self sizeWithFont:font size:maxSize].width;
}


- (CGFloat)heightWithFont:(UIFont *)font Width:(CGFloat)width {
    CGSize maxSize = CGSizeMake(width, 9999);
    return [self sizeWithFont:font size:maxSize].height;
}


- (CGFloat)heightWithFont:(UIFont *)font Width:(CGFloat)width RowHeight:(CGFloat)rowheight Spacing:(CGFloat)spacing {
    CGSize maxSize = CGSizeMake(width, 9999);
    int lineNumber = [self sizeWithFont:font size:maxSize].height/rowheight;
    return rowheight * lineNumber + spacing * (lineNumber - 1);
}

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)maxSize {
    return  [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:NULL].size;
}
@end
