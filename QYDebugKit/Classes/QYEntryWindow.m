//
//  QYEntryWindow.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYEntryWindow.h"
#import "QYHomeWindow.h"
#import "QYStatusBarViewController.h"

@interface QYEntryWindow()

@property (nonatomic, strong) UIButton *entryBtn;
@property (nonatomic, assign) CGFloat kEntryViewSize;
@property (nonatomic) CGPoint startingPosition;

@end


@implementation QYEntryWindow

- (UIButton *)entryBtn {
    if (!_entryBtn) {
        _entryBtn = [[UIButton alloc] initWithFrame:self.bounds];
        _entryBtn.backgroundColor = [UIColor yellowColor];
        [_entryBtn setTitle:@"测试入口" forState:UIControlStateNormal];
        [_entryBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _entryBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _entryBtn.layer.cornerRadius = 24.;
        [_entryBtn addTarget:self action:@selector(entryClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _entryBtn;
}


- (instancetype)initWithStartPoint:(CGPoint)startingPosition{
    self.startingPosition = startingPosition;
    _kEntryViewSize = 58;
    CGFloat x = self.startingPosition.x;
    CGFloat y = self.startingPosition.y;
    CGPoint defaultPosition = CGPointMake(0, [UIScreen mainScreen].bounds.size.height/3.0);
    if (x < 0 || x > ([UIScreen mainScreen].bounds.size.width - _kEntryViewSize)) {
        x = defaultPosition.x;
    }
    
    if (y < 0 || y > ([UIScreen mainScreen].bounds.size.height - _kEntryViewSize)) {
        y = defaultPosition.y;
    }
    
    self = [super initWithFrame:CGRectMake(x, y, _kEntryViewSize, _kEntryViewSize)];
    if (self) {
        #if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
            if (@available(iOS 13.0, *)) {
                UIScene *scene = [[UIApplication sharedApplication].connectedScenes anyObject];
                if (scene) {
                    self.windowScene = (UIWindowScene *)scene;
                }
            }
        #endif
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelStatusBar + 100.f;
        self.layer.masksToBounds = YES;
        
        // 统一使用 DoraemonStatusBarViewController
        // 对系统的版本处理放入 DoraemonStatusBarViewController 类中
        if (!self.rootViewController) {
            self.rootViewController = [[QYStatusBarViewController alloc] init];
        }

        
        [self.rootViewController.view addSubview:self.entryBtn];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)show{
    self.hidden = NO;
}

- (void)showClose:(NSNotification *)notification{
    [_entryBtn removeTarget:self action:@selector(showClose:) forControlEvents:UIControlEventTouchUpInside];
    [_entryBtn addTarget:self action:@selector(closePluginClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)closePluginClick:(UIButton *)btn{
    [_entryBtn removeTarget:self action:@selector(closePluginClick:) forControlEvents:UIControlEventTouchUpInside];
    [_entryBtn addTarget:self action:@selector(entryClick:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 进入工具主面板
 */
- (void)entryClick:(UIButton *)btn{
    if ([QYHomeWindow shareInstance].hidden) {
        [[QYHomeWindow shareInstance] show];
//        DoKitBP(@"dokit_sdk_home_ck_entry")
    }else{
        [[QYHomeWindow shareInstance] hide];
    }
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    if (self.autoDock) {
        [self autoDocking:pan];
    }else{
        [self normalMode:pan];
    }
}

- (void)normalMode: (UIPanGestureRecognizer *)panGestureRecognizer{
    //1、获得拖动位移
    CGPoint offsetPoint = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    //2、清空拖动位移
    [panGestureRecognizer setTranslation:CGPointZero inView:panGestureRecognizer.view];
    //3、重新设置控件位置
    UIView *panView = panGestureRecognizer.view;
    CGFloat newX = panView.center.x + offsetPoint.x;
    CGFloat newY = panView.center.y + offsetPoint.y;
    if (newX < _kEntryViewSize/2) {
        newX = _kEntryViewSize/2;
    }
    if (newX > [UIScreen mainScreen].bounds.size.width - _kEntryViewSize/2) {
        newX = [UIScreen mainScreen].bounds.size.width - _kEntryViewSize/2;
    }
    if (newY < _kEntryViewSize/2) {
        newY = _kEntryViewSize/2;
    }
    if (newY > [UIScreen mainScreen].bounds.size.height - _kEntryViewSize/2) {
        newY = [UIScreen mainScreen].bounds.size.height - _kEntryViewSize/2;
    }
    panView.center = CGPointMake(newX, newY);
}

- (void)autoDocking:(UIPanGestureRecognizer *)panGestureRecognizer {
    UIView *panView = panGestureRecognizer.view;
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [panGestureRecognizer translationInView:panView];
            [panGestureRecognizer setTranslation:CGPointZero inView:panView];
            panView.center = CGPointMake(panView.center.x + translation.x, panView.center.y + translation.y);
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            CGPoint location = panView.center;
            CGFloat centerX;
            CGFloat safeBottom = 0;
            if (@available(iOS 11.0, *)) {
               safeBottom = self.safeAreaInsets.bottom;
            }
            CGFloat centerY = MAX(MIN(location.y, CGRectGetMaxY([UIScreen mainScreen].bounds)-safeBottom), [UIApplication sharedApplication].statusBarFrame.size.height);
            if(location.x > CGRectGetWidth([UIScreen mainScreen].bounds) * 0.5f)
            {
                centerX = CGRectGetWidth([UIScreen mainScreen].bounds)-_kEntryViewSize/2;
            }
            else
            {
                centerX = _kEntryViewSize/2;
            }
            [[NSUserDefaults standardUserDefaults] setObject:@{
                                                               @"x":[NSNumber numberWithFloat:centerX],
                                                               @"y":[NSNumber numberWithFloat:centerY]
                                                               } forKey:@"FloatViewCenterLocation"];
            [UIView animateWithDuration:0.3 animations:^{
                panView.center = CGPointMake(centerX, centerY);
            }];
        }

        default:
            break;
    }
}



@end
