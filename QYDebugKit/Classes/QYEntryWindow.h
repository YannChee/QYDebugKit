//
//  QYEntryWindow.h
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 入口滑动浮窗（默认记录上次坐标）
@interface QYEntryWindow : UIWindow

/// 是否自动停靠，默认为YES
@property (nonatomic, assign) BOOL autoDock;

// 定制位置
- (instancetype)initWithStartPoint:(CGPoint)startingPosition;
- (void)show;

@end

NS_ASSUME_NONNULL_END
