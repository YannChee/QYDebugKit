//
//  QYBaseViewController.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYBaseViewController.h"

@interface QYBaseViewController ()

@end

@implementation QYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor labelColor]}];
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            //            [self.navigationController.navigationBar setShadowImage:[UIImage doraemon_imageWithColor:[UIColor doraemon_black_3] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
        }
    } else {
#endif
        self.view.backgroundColor = [UIColor whiteColor];
#if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
    }
#endif
    
    
//    UIImage *image = [UIImage doraemon_xcassetImageNamed:@"doraemon_back"];
#if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
    if (@available(iOS 13.0, *)) {
//        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//            image = [UIImage doraemon_xcassetImageNamed:@"doraemon_back_dark"];
//        }
    }
#endif
//    self.leftModel = [[DoraemonNavBarItemModel alloc] initWithImage:image selector:@selector(leftNavBackClick:)];
//    [self setLeftNavBarItems:@[self.leftModel]];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = [self needBigTitleView];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //输入框聚焦的时候，会把当前window设置为keyWindow，我们在当页面消失的时候，判断一下，把keyWindow交还给[[UIApplication sharedApplication].delegate window]
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        UIWindow *appWindow = [[UIApplication sharedApplication].delegate window];
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        if (appWindow != keyWindow) {
            [appWindow makeKeyWindow];
        }
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    // trait发生了改变
#if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                self.leftModel.image = [UIImage doraemon_xcassetImageNamed:@"doraemon_back_dark"];
//                [self.navigationController.navigationBar setShadowImage:[UIImage doraemon_imageWithColor:[UIColor doraemon_black_3] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
            } else {
//                self.leftModel.image = [UIImage doraemon_xcassetImageNamed:@"doraemon_back"];
            }
        }
    }
#endif
}

//是否需要大标题，默认不需要
- (BOOL)needBigTitleView{
    return NO;
}

- (void)setTitle:(NSString *)title{
//    if (_bigTitleView && !_bigTitleView.hidden) {
//        [_bigTitleView setTitle:title];
//    }else{
//        [super setTitle:title];
//    }
}

- (void)leftNavBackClick:(id)clickView{
    if (self.navigationController.viewControllers.count==1) {
//        [[QYHomeWindow shareInstance] hide];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)setLeftNavBarItems:(NSArray *)items{
    NSArray *barItems = [self navigationItems:items];
    if (barItems) {
        self.navigationItem.leftBarButtonItems = barItems;
    }
}

- (void)setRightNavBarItems:(NSArray *)items{
    NSArray *barItems = [self navigationItems:items];
    if (barItems) {
        self.navigationItem.rightBarButtonItems = barItems;
    }
}

- (void)setRightNavTitle:(NSString *)title{
//    DoraemonNavBarItemModel *item = [[DoraemonNavBarItemModel alloc] initWithText:title color:[UIColor doraemon_blue] selector:@selector(rightNavTitleClick:)];
//    NSArray *barItems = [self navigationItems:@[item]];
//    if (barItems) {
//        self.navigationItem.rightBarButtonItems = barItems;
//    }
}


- (NSArray *)navigationItems:(NSArray *)items{
//    NSMutableArray *barItems = [NSMutableArray array];
//    //距离左右的间距
//    UIBarButtonItem *spacer = [self getSpacerByWidth:-10];
//    [barItems addObject:spacer];
    
//    for (NSInteger i=0; i<items.count; i++) {
//
//        DoraemonNavBarItemModel *model = items[i];
//        UIBarButtonItem *barItem;
//        if (model.type == DoraemonNavBarItemTypeText) {//文字按钮
//            barItem = [[UIBarButtonItem alloc] initWithTitle:model.text style:UIBarButtonItemStylePlain target:self action:model.selector];
//            barItem.tintColor = model.textColor;
//        }else if(model.type == DoraemonNavBarItemTypeImage){//图片按钮
//            UIImage *image = [model.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//设置图片没有默认蓝色效果
            //默认的间距太大
//            barItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:model.selector];
//
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setImage:image forState:UIControlStateNormal];
//            [btn addTarget:self action:model.selector forControlEvents:UIControlEventTouchUpInside];
//            btn.frame = CGRectMake(0, 0, 30, 30);
//            btn.clipsToBounds = YES;
//            barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//        }else{
//            barItem = [[UIBarButtonItem alloc] init];
//        }
//        [barItems addObject:barItem];
//    }
//    return barItems;
    return  nil;
}

/**
 * 获取间距
 */
- (UIBarButtonItem *)getSpacerByWidth : (CGFloat)width{
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                               target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    spacer.width = width;
    return spacer;
}

#pragma mark - DoraemonBaseBigTitleViewDelegate
- (void)bigTitleCloseClick{
    [self leftNavBackClick:nil];
}

- (void)rightNavTitleClick:(id)clickView{
    
}

//点击屏幕空白处收起键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
