//
//  UITabBar+badge.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UITabBar+badge.h"
#import "Macros_Font.h"

#define TabbarItemNums 5.0
@implementation UITabBar (badge)

- (void)showBadgeOnItemIndex:(int)index count:(NSInteger)carCount {
    //移除之前的 badge
    [self removeBadgeOnItemIndex:index];
    
    //新建 badge
    UILabel *badgeView      = [[UILabel alloc]init];
    badgeView.font          = Font(10);
    badgeView.textColor     = [UIColor whiteColor];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.tag           = 888+ index;

    badgeView.layer.cornerRadius=7;
    badgeView.layer.masksToBounds = YES;
    badgeView.backgroundColor=[UIColor redColor];
    
    CGRect tabFrame=self.frame;
    
    //确定 badge位置
    float percentX = (index +0.6) /TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    if (carCount > 0 && carCount < 10) {
        badgeView.text = [NSString stringWithFormat:@"%ld", (long)carCount];
        badgeView.frame= CGRectMake(x, y,14,14);
    }
    else if (carCount>=10) {
        badgeView.text = [NSString stringWithFormat:@"%ld", (long)carCount];
        badgeView.frame= CGRectMake(x, y,20,14);
    }
    else if (carCount>99) {
        badgeView.text = @"99+";
        badgeView.frame= CGRectMake(x, y,25,14);
    }
    [self addSubview:badgeView];
}
- (void)hideBadgeOnItemIndex:(int)index {
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(int)index {
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888 + index) {
            [subView removeFromSuperview];
        }
    }
}
@end
