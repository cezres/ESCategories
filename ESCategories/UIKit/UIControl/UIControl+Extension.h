//
//  UIControl+Extension.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>
#define NAVIITEM_INTERVAL 0.5
@interface UIControl (Extension)
/**
 *  两次响应之间的时间间隔
 */
@property (nonatomic, assign) NSTimeInterval acceptEventInterval;
/**
 *  是否忽略事件true 忽略 flase不忽略
 */
@property (nonatomic, strong) NSNumber *ignoreEvent;
@end
