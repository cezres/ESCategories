//
//  UINavigationItem+Extension.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UINavigationItem+Extension.h"
#import "UIView+Frame.h"
#import <objc/runtime.h>
#import "Macros_Font.h"


@implementation UINavigationItem (Extension)
- (void)setMessageCountWithCount:(NSNumber *)count {
    if (count.integerValue> 0) {
        self.countLabel.hidden = NO;
        if (count.integerValue > 9) {
            self.countLabel.width = 20;
            self.countLabel.text = @"9+";
        }
        else {
            self.countLabel.width = 14;
            self.countLabel.text =  [NSString stringWithFormat:@"%ld",(long)count.integerValue];
        }
    }
    else {
        self.countLabel.width = 14;
        self.countLabel.hidden = YES;
    }
}

#pragma mark - Get
- (NSArray<UIButton *> *)leftBarButtons {
    return self.leftBarButtonItems[1].customView.subviews;
}

- (NSArray<UIButton *> *)rightBarButtons {
    return self.leftBarButtonItems[1].customView.subviews;
}

- (UILabel *)countLabel {
    return objc_getAssociatedObject(self, @selector(countLabel));
}

- (NSArray<UIButton *> *)noticeLeftBarButtons {
   return self.leftBarButtonItems[1].customView.subviews;
}

#pragma makr - Sett
- (void)setLeftBarButtons:(NSArray<__kindof UIButton *> *)leftBarButtons {
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -16;
    UIView *customView = [[UIView alloc] init];
    for (NSInteger i = 0; i < leftBarButtons.count; i++) {
        if (i == 0) {
            leftBarButtons[i].x = 0;
        }
        else{
            leftBarButtons[i].x = leftBarButtons[i-1].maxX;
        }
        [customView addSubview:leftBarButtons[i]];
    }
    
    customView.frame = CGRectMake(0, 0, leftBarButtons.lastObject.maxX, 44);
    UIBarButtonItem *items = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.leftBarButtonItems = @[spacer,items];
}

- (void)setRightBarButtons:(NSArray<__kindof UIButton *> *)rightBarButtons {
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -10;
    UIView *customView = [[UIView alloc] init];
    for (NSInteger i=0; i<rightBarButtons.count; i++) {
        if (i==0) {
            rightBarButtons[i].x=0;
        }
        else {
            rightBarButtons[i].x=rightBarButtons[i-1].maxX;
        }
        [customView addSubview:rightBarButtons[i]];
    }
    customView.frame = CGRectMake(0, 0, rightBarButtons.lastObject.maxX, 44);
    
    for (UIButton *button in rightBarButtons) {
        button.x = customView.width - button.x - button.width;
        [customView addSubview:button];
    }
    UIBarButtonItem *items = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.rightBarButtonItems = @[spacer, items];
}

- (void)setCountLabel:(UILabel *)countLabel {
    objc_setAssociatedObject(self, @selector(countLabel), countLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNoticeLeftBarButtons:(NSArray<__kindof UIButton *> *)noticeLeftBarButtons {
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -16;
    
    UIView *customView = [[UIView alloc] init];
    customView.frame = CGRectMake(0, 0, noticeLeftBarButtons.lastObject.maxX, 44);
    
    for (UIButton *button in noticeLeftBarButtons) {
        [customView addSubview:button];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(noticeLeftBarButtons.lastObject.maxX-23, 5,14, 14)];
    label.layer.cornerRadius = 7;
    label.layer.masksToBounds = YES;
    
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.font = Font(10);
    label.textAlignment = NSTextAlignmentCenter;
    [customView addSubview:label];
    
    self.countLabel = label;
    UIBarButtonItem *items = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.leftBarButtonItems = @[spacer, items];
}

@end
