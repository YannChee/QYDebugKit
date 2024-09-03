//
//  QYNavigationController.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYNavigationController.h"

@implementation QYNavigationController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 检查当前的视图控制器是否是根视图控制器
    [self updateNavigationBarVisibility];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    // 在推送后进行更新
    [self updateNavigationBarVisibility];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController *poppedViewController = [super popViewControllerAnimated:animated];
    
    // 在弹出后进行更新
    [self updateNavigationBarVisibility];
    
    return poppedViewController;
}

- (void)updateNavigationBarVisibility {
    if (self.topViewController == self.viewControllers.firstObject) {
        // 如果当前视图控制器是根视图控制器，隐藏导航栏
        [self setNavigationBarHidden:YES animated:NO];
    } else {
        // 否则，显示导航栏
        [self setNavigationBarHidden:NO animated:NO];
    }
}

@end
