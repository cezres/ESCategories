//
//  UIView+Frame.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

#pragma mark point

@property (assign, nonatomic) CGFloat x;

@property (assign, nonatomic) CGFloat y;

@property (assign, nonatomic) CGFloat centerX;

@property (assign, nonatomic) CGFloat centerY;

@property (assign, nonatomic) CGFloat maxX;

@property (assign, nonatomic) CGFloat maxY;

@property (assign, nonatomic) CGPoint origin;

#pragma mark size

@property (assign, nonatomic) CGFloat width;

@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGSize  size;

@end
