//
//  QYHomeWindow.h
//  Runner
//
//  Created by Yann_Dev on 2023/8/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYHomeWindow : UIWindow

@property (nonatomic, strong) UINavigationController *nav;

+ (instancetype)shareInstance;

// open plugin vc
+ (void)openPlugin:(UIViewController *)vc;

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END
