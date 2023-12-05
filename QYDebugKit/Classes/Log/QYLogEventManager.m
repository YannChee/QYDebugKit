//
//  QYLogEventManager.m
//  flutter_debug_kits
//
//  Created by Yann_Dev on 2023/9/1.
//

#import "QYLogEventManager.h"


@interface QYLogEventManager()

@property(nonatomic, assign) NSUInteger lineNum;

@end

@implementation QYLogEventManager {
    NSMutableString *_logContentStr;
}


- (void)saveEventName:(NSString *)eventName content:(NSString *)content {
    
    NSString *nextLineStr = [NSString stringWithFormat:@"名字: %@ \n内容: %@",eventName,(content ? content : @"")];
    [self.logContentStr appendString:[NSString stringWithFormat:@"\n=====%zd===\n",++self.lineNum]];
    
    [self.logContentStr appendString:nextLineStr];
}

- (instancetype)init {
    if (self = [super init]){
        _logContentStr = [NSMutableString string];
    }
    return self;
}

- (void)clearCachedEvent {
    self.lineNum = 0;
    [self.logContentStr setString:@""];
}
@end
