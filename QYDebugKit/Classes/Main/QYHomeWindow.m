//
//  QYHomeWindow.m
//  Runner
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYHomeWindow.h"
#import "QYNavigationController.h"
#import "QYHomeViewController.h"

@interface QYHomeWindow ()

@end

@implementation QYHomeWindow


+ (instancetype)shareInstance{
    static dispatch_once_t once;
    static QYHomeWindow *instance;
    dispatch_once(&once, ^{
        instance = [[QYHomeWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    });
    return instance;
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelStatusBar - 1.f;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = YES;
#if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes){
                if (windowScene.activationState == UISceneActivationStateForegroundActive){
                    self.windowScene = windowScene;
                    break;
                }
            }
        }
#endif
    }
    return self;
}

- (void)openPlugin:(UIViewController *)vc{
    [self setRootVc:vc];
     self.hidden = NO;
}

- (void)show{
    if (self.rootViewController.childViewControllers.count == 0) {
        QYHomeViewController *vc = [[QYHomeViewController alloc] init];
        [self setRootVc:vc];
    }
   
    self.hidden = NO;
    QYNavigationController *nav = (QYNavigationController *)self.rootViewController;
//    [nav.childViewControllers performSelector:@selector(viewDidAppear:)];
    for (UIViewController *vc in nav.childViewControllers) {
//        [vc viewDidAppear:NO];
        [vc endAppearanceTransition]; // 在视图出现后调用
    }

}


- (void)hide{
    if (self.rootViewController.presentedViewController) {
        [self.rootViewController.presentedViewController dismissViewControllerAnimated:NO completion:nil];
    }

    self.hidden = YES;
    QYNavigationController *nav = (QYNavigationController *)self.rootViewController;
//    [nav.childViewControllers performSelector:@selector(viewDidDisappear:)];
    for (UIViewController *vc in nav.childViewControllers) {
        [vc viewDidDisappear:NO];
    }
}


- (void)setRootVc:(UIViewController *)rootVc{
    if (rootVc) {
        QYNavigationController *nav = [[QYNavigationController alloc] initWithRootViewController:rootVc];
        NSDictionary *attributesDic = @{
            NSForegroundColorAttributeName:[UIColor blackColor],
            NSFontAttributeName:[UIFont systemFontOfSize:18]
        };
        [nav.navigationBar setTitleTextAttributes:attributesDic];
        _nav = nav;
        
        self.rootViewController = nav;
    }else{
        self.rootViewController = nil;
        _nav = nil;
    }
    
}

+ (void)openPlugin:(UIViewController *)vc{
    [[self shareInstance] openPlugin:vc];
}

@end
