//
//  UIImage+Scale.m
//  Categories
//
//  Created by 翟泉 on 2016/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

- (UIImage *)scaleImageWithNewWidth:(CGFloat)width {
    if (self.size.width == width) {
        return self;
    }
    CGSize size = CGSizeMake(width, width/self.size.width * self.size.height);
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thumbnail;
}

@end
