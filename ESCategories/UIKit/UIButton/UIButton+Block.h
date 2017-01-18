//
//  UIButton+Block.h
//  Categories
//
//  Created by fengjiwen on 16/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

@property(copy, nonatomic) void (^touchUpInsideBlock)();

// 按钮添加block回调方式
- (void)setEventTouchUpInsideBlock:(void (^)())eventTouchUpInsideBlock;

@end
