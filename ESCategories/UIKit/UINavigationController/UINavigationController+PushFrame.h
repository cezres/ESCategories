//
//  UINavigationController+PushFrame.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (PushFrame)

/// 当前控制器
@property (assign, nonatomic, readonly) __kindof UIViewController *currentViewController;

/// 第一个控制器
@property (strong, nonatomic, readonly) __kindof UIViewController *firstViewController;

/// 倒数第二个控制器
@property (assign, nonatomic, readonly) __kindof UIViewController *previouViewController;


/**
 *  从指定索引切换到新的视图控制器
 *
 *  @param viewController <#viewController description#>
 *  @param index          <#index description#>
 *  @param animated       <#animated description#>
 */
- (void)pushViewController:(UIViewController *)viewController frameIndex:(NSInteger)index animated:(BOOL)animated;

@end



