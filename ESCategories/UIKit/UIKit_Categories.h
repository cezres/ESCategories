//
//  UIKit_Categories.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#ifndef UIKit_Categories_h
#define UIKit_Categories_h


#pragma mark - UIView

#import "UIView+Frame.h"    /// 更方便的设置、获取视图的位置和尺寸
#import "UIView+Capture.h"  /// 截图

#pragma mark - UIImage

#import "UIImage+Scale.h"   /// 图片缩放
#import "UIImage+Color.h"   /// 根据颜色初始化图片
#import "UIImage+Square.h"  /// 居中截取一个最大的方形

#pragma mark - UILabel

#import "UILabel+Size.h"    /// 获取文本内容宽/高

#pragma mark - UITextView

#import "UITextView+Placeholder.h"  /// 文本视图，添加占位字符串属性

#pragma mark - UIControl

#import "UIControl+Extension.h"   /// 相应时间间隔

#pragma mark - UIDevice

#import "UIDevice+DeviceType.h" /// 获取设备型号

#pragma mark - UINavigationItem

#import "UINavigationItem+Extension.h" /// 设置导航栏左边按钮 与 右边按钮

#pragma mark - UIColor

#import "UIColor+HexColor.h"   /// Hex 转换为 UIColor

#pragma mark - UITextField

#import "UITextField+image.h" /// 设置输入框右边图片

#pragma mark - UITabBar

#import "UITabBar+badge.h"   /// 设置TabBar  badge

#pragma mark - UINavigationController

#import "UINavigationController+PushFrame.h" /// 获取控制器

#pragma mark - UIButton 

#import "UIButton+BadgeValue.h"     /// 按钮右上角红点
#import "UIButton+Block.h"          /// 按钮点击block回调方式
#import "UIButton+LayoutSubviews.h" /// 按钮里图片 文字布局

#pragma mark - UIAlertView

#import "UIAlertView+Block.h"   /// UIAlertView 添加block回调

#endif /* UIKit_Categories_h */
