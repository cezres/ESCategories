//
//  UIButton+BadgeValue.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BadgeValue)

// 外界传的数字
@property (strong, nonatomic) NSString *badgeValue;

// 小红点lable
@property (strong, nonatomic, readonly) UILabel *badgeLabel;

@end
