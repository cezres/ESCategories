//
//  UIButton+BadgeValue.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIButton+BadgeValue.h"
#import <objc/runtime.h>
#import "Macros_Color.h"
#import "Macros_Font.h"
#import "Foundation_Categories.h"

@implementation UIButton (BadgeValue)

#pragma mark - Get
- (NSString *)badgeValue {
    return self.badgeLabel.text;
}

- (UILabel *)badgeLabel {
    UILabel *object = objc_getAssociatedObject(self, _cmd);
    if (NULL == object) {
        object = [[UILabel alloc] init];
        object.font = Font(10);
        object.textAlignment = NSTextAlignmentCenter;
        object.textColor = [UIColor whiteColor];
        object.backgroundColor = ColorRGB(253, 85, 98);
        object.layer.cornerRadius = 7;
        object.layer.masksToBounds = YES;
        [self addSubview:object];
        objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return object;
}

#pragma mark - Set
- (void)setBadgeValue:(NSString *)badgeValue {
    if ([badgeValue isValid]) {
        CGFloat width = [self.badgeValue widthWithFont:self.badgeLabel.font height:14];
        CGFloat maxWidth = 0;
        if (width + 7 > 14) {
            maxWidth = width + 7;
        }else {
            maxWidth = width;
        }
        self.badgeLabel.text = badgeValue;
        self.badgeLabel.hidden = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:maxWidth]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:0
                                                          constant:14]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:4]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:8]];
        
    }
    else {
        self.badgeLabel.hidden = NO;
    }
}

@end
