//
//  UIImage+Square.m
//  Categories
//
//  Created by 翟泉 on 2016/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIImage+Square.h"

@implementation UIImage (Square)

- (UIImage *)square {
    CGRect rect;
    if (self.size.width > self.size.height) {
        rect = CGRectMake((self.size.width - self.size.height) / 2, 0, self.size.height, self.size.height);
    }
    else if (self.size.width < self.size.height) {
        rect = CGRectMake(0, (self.size.height - self.size.width) / 2, self.size.width, self.size.width);
    }
    else {
        return self;
    }
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect small = CGRectMake(0, 0, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    UIGraphicsBeginImageContext(small.size);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(imageRef);
    return image;
}

@end
