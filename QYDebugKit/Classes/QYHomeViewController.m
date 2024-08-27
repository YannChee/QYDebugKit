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


@interface QYHomeViewController ()

@property(nonatomic, strong) UIStackView *stackView;

@end

@implementation QYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:self.stackView];
    
    
   
    [self.stackView addArrangedSubview:[self.class creatBtnWithTitle:@"日志打印页面" tag:0 target:self]];
    [self.stackView addArrangedSubview:[self.class creatBtnWithTitle:@"flex 开关" tag:1 target:self]];
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
    
    CGRect tempFrame = self.view.bounds;
    self.stackView.frame = CGRectMake(0, 44, tempFrame.size.width, 200);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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


@end
