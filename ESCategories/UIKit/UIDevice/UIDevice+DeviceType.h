//
//  UIDevice+DeviceType.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (DeviceType)
/**
 *  设备类型
 */
@property (assign, nonatomic, readonly) NSString *model;
@end
