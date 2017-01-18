//
//  UIAlertView+Block.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@implementation UIAlertView (Block)

- (void)setClickedButtonCallback:(void (^)(NSInteger))clickedButtonCallback; {
    objc_setAssociatedObject(self, @selector(clickedButtonCallback), clickedButtonCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSInteger))clickedButtonCallback {
    return objc_getAssociatedObject(self, @selector(clickedButtonCallback));
}

+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message ClickedButtonBlock:(void (^)(void))clickedButtonBlock {
    return [self alertWithTitle:title message:message cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] ClickedButtonCallback:^(NSInteger index) {
        if (index == 1) {
            clickedButtonBlock();
        }
    }];
}

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles ClickedButtonCallback:(void (^)(NSInteger))ClickedButtonCallback {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    for (NSString *title in otherButtonTitles) {
        [alertView addButtonWithTitle:title];
    }
    alertView.delegate = alertView;
    alertView.clickedButtonCallback = ClickedButtonCallback;
    [alertView show];
    return alertView;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.clickedButtonCallback ? self.clickedButtonCallback(buttonIndex) : NULL;
}

@end
