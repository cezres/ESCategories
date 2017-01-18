//
//  UIAlertView+Block.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)

// 展示UIAlertView 点击确定回调
+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message ClickedButtonBlock:(void (^)(void))clickedButtonBlock;

// 展示UIAlertView 点击对应索引回调
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles ClickedButtonCallback:(void (^)(NSInteger index))clickedButtonCallback;

@end
