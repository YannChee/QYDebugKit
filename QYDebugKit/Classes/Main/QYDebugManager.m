//
//  QYDebugManager.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYDebugManager.h"
#import "QYEntryWindow.h"
#import "QYLogEventManager.h"
#import <YYModel/YYModel.h>
#import "QYHomeWindow.h"


static NSArray<UIButton *> *customFuctionButtonsArr;
@interface QYDebugManager()

@property (nonatomic, strong) QYEntryWindow *entryWindow;

@property (nonatomic, assign) BOOL isInitialized;



// 定制位置
@property (nonatomic) CGPoint startingPosition;

@end
@implementation QYDebugManager

+ (nonnull instancetype)shareInstance{
    static dispatch_once_t once;
    static QYDebugManager *instance;
    dispatch_once(&once, ^{
        instance = [[QYDebugManager alloc] init];
    });
    return instance;
}
/**
 初始化工具入口
 */
- (void)initEntry:(CGPoint) startingPosition{
    _entryWindow = [[QYEntryWindow alloc] initWithStartPoint:startingPosition];
    [_entryWindow show];

    [_entryWindow setAutoDock:YES];

}

- (void)exit {
    [self.entryWindow close];
    self.entryWindow = nil;
}


- (void)initDenugSDKWithStartingPosition:(CGPoint)position customFunctionButtons:(NSArray<UIButton *> *)btnsArr completion:(void(^)(void))completion {
    [self.class setupCustomFunctionButtons:btnsArr];
    _startingPosition = position;
    //保证install只执行一次
    if (self.isInitialized) {
        return;
    }
    self.isInitialized = YES;
    
    !completion ?: completion();

    [self initEntry:self.startingPosition];
  
}

+ (void)setupCustomFunctionButtons:(NSArray<UIButton *> *)btnsArr {
    customFuctionButtonsArr = btnsArr;
}

+ (NSArray<UIButton *> *)customFunctionButtons {
    return customFuctionButtonsArr;
}

- (UINavigationController *)debugNavigationController {
    return QYHomeWindow.shareInstance.rootNavigationController;
}

#pragma mark - log
- (void)logEventName:(NSString *)eventName paramDict:(NSDictionary *)paramDict {
    NSString *json = paramDict.yy_modelDescription;
    [self.logEventManager saveEventName:eventName content:json];
}

- (void)logEventName:(NSString *)eventName content:(NSString *)content {
    [self.logEventManager saveEventName:eventName content:content.yy_modelDescription];
}


- (QYLogEventManager *)logEventManager {
    if (!_logEventManager) {
        _logEventManager = [QYLogEventManager new];
    }
    return _logEventManager;
}
@end
