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


+ (nonnull instancetype)shareInstance;

- (void)initDenugSDKWithStartingPosition:(CGPoint)position completion:(void(^)(void))completion;


- (void)logEventName:(NSString *)eventName content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
