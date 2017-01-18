//
//  UIButton+LayoutSubviews.m
//  Categories
//
//  Created by fengjiwen on 16/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIButton+LayoutSubviews.h"
#import <objc/runtime.h>
#import "NSObject+SwiizzleMethod.h"

@implementation UIButton (LayoutSubviews)

#pragma mark - Init
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) swizzledSelector:@selector(aop_layoutSubviews)];
    });
}

- (void)aop_layoutSubviews {
    [self aop_layoutSubviews];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CGRect imageRect = self.imageViewFrame;
    if (!CGRectEqualToRect(imageRect, CGRectZero)) {
        if (!CGRectEqualToRect(self.imageView.frame, imageRect)) {
            self.imageView.frame = imageRect;
        }
    }
    if (!CGRectEqualToRect(self.titleLabelFrame, CGRectZero)) {
        if (!CGRectEqualToRect(self.titleLabel.frame, self.titleLabelFrame)) {
            self.titleLabel.frame = self.titleLabelFrame;
        }
    }
    [CATransaction commit];
}

#pragma mark - Get
- (CGRect)imageViewFrame {
    return [objc_getAssociatedObject(self, @selector(imageViewFrame)) CGRectValue];
}

- (CGRect)titleLabelFrame {
    return [objc_getAssociatedObject(self, @selector(titleLabelFrame)) CGRectValue];
}

#pragma mark - Set
- (void)setImageViewFrame:(CGRect)imageViewFrame {
    objc_setAssociatedObject(self, @selector(imageViewFrame), [NSValue valueWithCGRect:imageViewFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTitleLabelFrame:(CGRect)titleLabelFrame {
    objc_setAssociatedObject(self, @selector(titleLabelFrame), [NSValue valueWithCGRect:titleLabelFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
