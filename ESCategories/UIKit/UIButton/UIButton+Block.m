//
//  UIButton+Block.m
//  Categories
//
//  Created by fengjiwen on 16/9/28.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

@implementation UIButton (Block)

- (void (^)())touchUpInsideBlock {
    return objc_getAssociatedObject(self, @selector(touchUpInsideBlock));
}

- (void)setTouchUpInsideBlock:(void (^)())touchUpInsideBlock {
    objc_setAssociatedObject(self, @selector(touchUpInsideBlock), touchUpInsideBlock, OBJC_ASSOCIATION_COPY);
}

- (void)setEventTouchUpInsideBlock:(void (^)())eventTouchUpInsideBlock {
    self.touchUpInsideBlock = eventTouchUpInsideBlock;
    [self addTarget:self action:@selector(eventTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
}

//点击回调
- (void)eventTouchUpInside {
    if (self.touchUpInsideBlock) {
        self.touchUpInsideBlock();
    }
}

@end
