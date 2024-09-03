//
//  QYHomeViewController.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYHomeViewController.h"
#import "QYLogEventController.h"
#import "QYDebugManager.h"
#import "QYLogEventController.h"
#import "FLEXManager.h"
#import "QYDebugManager.h"


@interface QYHomeViewController ()

@property(nonatomic, strong) UIStackView *stackView;

@property(nonatomic, strong) UIButton *closeBtn;

@end

@implementation QYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:self.stackView];
    [self.view addSubview:self.closeBtn];
    [self setupFunctionButtons];
}

- (void)setupFunctionButtons {
    NSMutableArray *tempArr = [NSMutableArray array];
    [tempArr addObject:[self.class creatBtnWithTitle:@"日志打印页面" tag:0 target:self]];
    [tempArr addObject:[self.class creatBtnWithTitle:@"veiw检查 开关" tag:1 target:self]];
    [tempArr addObjectsFromArray:QYDebugManager.customFunctionButtons];
    
    for (NSInteger i = 0; i < tempArr.count; i++) {
        UIButton *btn = tempArr[i];
        [self.stackView addArrangedSubview:btn];
    }
}

+ (UIButton *)creatBtnWithTitle:(NSString *)btnTitle tag:(NSUInteger)tag target:(nullable id)target{
    UIButton *btn = [UIButton new];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.purpleColor;
    btn.tag = tag;
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [btn addTarget:target action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnClick:(UIButton *)btn {
    
    switch (btn.tag) {
        case 0: {
            QYLogEventController *logVC = [QYLogEventController new];
            [self.navigationController pushViewController:logVC animated:YES];
            return;
        }
            
        case 1: {
            [[FLEXManager sharedManager] showExplorer];
            return;
        }
        // You can add more cases as needed
        default:
            // Code to execute if expression does not match any case
            break;
    }

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat btnHeight = 44;
    CGFloat margin = 10;
    CGFloat stackViewHeight = self.stackView.arrangedSubviews.count * (btnHeight + margin);
    CGRect tempFrame = self.view.bounds;
    self.stackView.frame = CGRectMake(0, 88, tempFrame.size.width, stackViewHeight);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)exit {
    [QYDebugManager.shareInstance exit];
}

- (UIStackView *)stackView {
    if (!_stackView) {
        UIStackView *stackView = [[UIStackView alloc] init];
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.distribution = UIStackViewDistributionFillProportionally;
        stackView.spacing = 10;
        _stackView = stackView;
    }
    return _stackView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,  UIScreen.mainScreen.bounds.size.height - 50, UIScreen.mainScreen.bounds.size.width, 50)];
        _closeBtn.backgroundColor = [UIColor yellowColor];
        [_closeBtn setTitle:@"Exit" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _closeBtn.layer.cornerRadius = 24.;
        [_closeBtn addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    }

    return _closeBtn;
}
@end
