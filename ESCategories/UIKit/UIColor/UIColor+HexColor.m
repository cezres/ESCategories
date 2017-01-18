//
//  UIColor+HexColor.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+ (UIColor *)colorFromHexRGB:(NSString *)hexColorStr {
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    if (!hexColorStr) {
        return nil;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hexColorStr];
    [scanner scanHexInt:&colorCode];
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode);
    return [UIColor colorWithRed: redByte/255.0 green: greenByte/255.0 blue: blueByte/255.0 alpha:1.0];
}
@end
