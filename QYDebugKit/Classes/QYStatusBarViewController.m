//
//  DoraemonStatusBarViewController.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYStatusBarViewController.h"

@interface QYStatusBarViewController ()

@end

@implementation QYStatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//iOS9的系统中，新建的window设置的rootViewController默认没有显示状态栏

#if __IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_9_3

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#endif
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return DoraemonManager.shareInstance.supportedInterfaceOrientations;
//}

@end
