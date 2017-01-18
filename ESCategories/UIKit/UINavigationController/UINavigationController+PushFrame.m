//
//  UINavigationController+PushFrame.m
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UINavigationController+PushFrame.h"
#import "UIView+Capture.h"

@implementation UINavigationController (PushFrame)


- (void)pushViewController:(UIViewController *)viewController frameIndex:(NSInteger)index animated:(BOOL)animated {
    if (index + 1 > self.viewControllers.count) {   // 索引错误
        return;
    }
    else if (index + 1 == self.viewControllers.count) { // 如果索引是当前控制器，直接Push
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    UIViewController *currentViewController = self.currentViewController;
    UIViewController *frameViewController = self.viewControllers[index];
    
    
    [self popToViewController:frameViewController animated:NO];
    
    if (animated) {
        // 为目标视图控制器添加截屏视图
        UIImageView *captureView = [[UIImageView alloc] init];
        captureView.image = currentViewController.view.capture;
        captureView.frame = [UIScreen mainScreen].bounds;
        [frameViewController.view addSubview:captureView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self pushViewController:viewController animated:YES];
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [captureView removeFromSuperview];
        });
        
    }
    else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self pushViewController:viewController animated:NO];
        });
    }
    
}

#pragma mark - Get
- (UIViewController *)currentViewController {
    return self.viewControllers[self.viewControllers.count - 1];
}

- (UIViewController *)previouViewController {
    if (self.viewControllers.count < 2) {
        return NULL;
    }
    return self.viewControllers[self.viewControllers.count - 2];
}

- (UIViewController *)firstViewController {
    return self.viewControllers.firstObject;
}

@end
