//
//  UITextField+image.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UITextField+image.h"

@implementation UITextField (image)
-(void)setRightViewImage:(NSString *)imageName {
    NSString *str = @"icon-clear";
    if (imageName) {
        str = imageName;
    }
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIImageView *imgv    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
    self.rightView       = imgv;
}
@end
