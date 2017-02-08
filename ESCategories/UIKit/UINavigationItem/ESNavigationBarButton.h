//
//  ESNavigationBarButton.h
//  ESCategories
//
//  Created by 翟泉 on 2017/2/7.
//  Copyright © 2017年 翟泉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESNavigationBarButton : UIButton

+ (instancetype)buttonWithImageName:(NSString *)imageName;

+ (instancetype)buttonWithTitle:(NSString *)title;

+ (instancetype)buttonWithImageName:(NSString *)imageName Target:(id)target action:(SEL)action;

@end
