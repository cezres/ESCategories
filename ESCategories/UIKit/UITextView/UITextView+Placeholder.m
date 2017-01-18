//
//  UITextView+Placeholder.m
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

#import "Macros_Color.h"

#import "NSObject+SwiizzleMethod.h"


@implementation UITextView (Placeholder)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(setFont:) swizzledSelector:@selector(placeholder_setFont:)];
    });
}

#pragma mark - AOP
- (void)placeholder_setFont:(UIFont *)font {
    [self placeholder_setFont:font];
    if (self.placeholderLabel) {
        self.placeholderLabel.font = font;
        [self setNeedsLayout];
    }
}

- (void)placeholder_layoutSubviews {
    [self placeholder_layoutSubviews];
    if (self.placeholderLabel) {
        self.placeholderLabel.frame = CGRectMake(4, 7, self.bounds.size.width - 8, self.font.lineHeight);
    }
}


#pragma mark - Set
- (void)setPlaceholder:(NSString *)placeholder {
    UILabel *label = self.placeholderLabel;
    if (!label) {
        label = [[UILabel alloc] init];
        label.font = self.font;
        label.textColor = ColorWhite(186);
        [self addSubview:label];
        self.placeholderLabel = label;
    }
    self.placeholderLabel.text = placeholder;
}

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    objc_setAssociatedObject(self, @selector(placeholderLabel), placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Get
- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (UILabel *)placeholderLabel {
    return objc_getAssociatedObject(self, @selector(placeholderLabel));
}

@end
