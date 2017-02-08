//
//  ESNavigationBarButton.m
//  ESCategories
//
//  Created by 翟泉 on 2017/2/7.
//  Copyright © 2017年 翟泉. All rights reserved.
//

#import "ESNavigationBarButton.h"
#import "UIControl+Extension.h"

@implementation ESNavigationBarButton

+ (instancetype)buttonWithImageName:(NSString *)imageName; {
    ESNavigationBarButton *button = [super buttonWithType:UIButtonTypeSystem];
    button.acceptEventInterval = NAVIITEM_INTERVAL;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    button.tintColor = ColorRGB(34, 34, 34);
    button.frame = CGRectMake(0, 9, 44, 26);
    
    button.imageViewFrame = CGRectMake((button.width-44)/2, (button.height-44)/2, 44, 44);
    
    
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title; {
    ESNavigationBarButton *button = [ESNavigationBarButton buttonWithType:UIButtonTypeSystem];
    button.acceptEventInterval = NAVIITEM_INTERVAL;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:ColorRGB(34, 34, 34) forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    CGFloat width = [title widthWithFont:button.titleLabel.font height:20];
    
    button.frame = CGRectMake(0, 9, width+10, 26);
    button.titleLabelFrame = CGRectMake(0, (button.height-20)/2, button.width, 20);
    
    return button;
}

+ (instancetype)buttonWithImageName:(NSString *)imageName Target:(id)target action:(SEL)action; {
    ESNavigationBarButton *button = [self buttonWithImageName:imageName];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}



@end
