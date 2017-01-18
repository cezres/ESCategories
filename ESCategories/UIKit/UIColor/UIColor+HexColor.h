//
//  UIColor+HexColor.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
/**
 *  Hex转UIColor
 *
 *  @param hexColorStr Hex
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromHexRGB:(NSString *)hexColorStr;
@end
