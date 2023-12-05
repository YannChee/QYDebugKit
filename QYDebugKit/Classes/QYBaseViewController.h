//
//  QYBaseViewController.h
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYBaseViewController : UIViewController


- (void)setLeftNavBarItems:(NSArray *)items;
- (void)leftNavBackClick:(id)clickView;
- (void)setRightNavTitle:(NSString *)title;
- (void)rightNavTitleClick:(id)clickView;
- (void)setRightNavBarItems:(NSArray *)items;


@end

NS_ASSUME_NONNULL_END
