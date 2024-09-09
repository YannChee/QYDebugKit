//
//  QYDebugManager.h
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import <Foundation/Foundation.h>



 

NS_ASSUME_NONNULL_BEGIN
@class QYLogEventManager;
@interface QYDebugManager : NSObject

@property(nonatomic, strong) QYLogEventManager *logEventManager;

@property(nonatomic, weak, readonly) UINavigationController *debugNavigationController;

+ (nonnull instancetype)shareInstance;


+ (NSArray<UIButton *> *)customFunctionButtons;

- (void)initDenugSDKWithStartingPosition:(CGPoint)position customFunctionButtons:( NSArray<UIButton *> * _Nullable )btnsArr completion:(void(^ _Nullable)(void))completion;
- (void)exit;

/** 打印日志 */
- (void)logEventName:(NSString *)eventName paramDict:(NSDictionary *)paramDict;
- (void)logEventName:(NSString *)eventName content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
