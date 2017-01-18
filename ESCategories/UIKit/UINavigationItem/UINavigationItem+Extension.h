//
//  UINavigationItem+Extension.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (Extension)
/**
 *  导航栏左边通知(小铃铛)
 */
@property (strong, nonatomic) NSArray<__kindof UIButton *> *noticeLeftBarButtons;
/**
 *  导航栏左边Item
 */
@property (strong, nonatomic) NSArray<__kindof UIButton *> *leftBarButtons;
/**
 *  导航栏右边Item
 */
@property (strong, nonatomic) NSArray<__kindof UIButton *> *rightBarButtons;
/**
 *  导航栏数量Label
 */
@property (strong, nonatomic) UILabel *countLabel;
/**
 *  设置导航栏左边通知数量
 *
 *  @param count 数量
 */
-(void)setMessageCountWithCount:(NSNumber *)count;

@end
