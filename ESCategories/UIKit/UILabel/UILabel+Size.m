//
//  UILabel+Size.m
//  Categories
//
//  Created by 翟泉 on 2016/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UILabel+Size.h"

@implementation UILabel (Size)

- (CGFloat)textHeight {
    [self layoutIfNeeded];
    return [self textRectForBounds:CGRectMake(0, 0, self.bounds.size.width, 9999) limitedToNumberOfLines:self.numberOfLines].size.height;
}

- (CGFloat)textWidth {
    [self layoutIfNeeded];
    return [self textRectForBounds:CGRectMake(0, 0, 9999, self.bounds.size.height) limitedToNumberOfLines:self.numberOfLines].size.width;
}

@end
