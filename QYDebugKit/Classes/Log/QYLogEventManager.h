//
//  QYLogEventManager.h
//  flutter_debug_kits
//
//  Created by Yann_Dev on 2023/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYLogEventManager : NSObject

@property(nonatomic, strong,readonly) NSMutableString *logContentStr;

- (void)saveEventName:(NSString *)eventName content:(NSString *)content;

- (void)clearCachedEvent;
@end

NS_ASSUME_NONNULL_END
