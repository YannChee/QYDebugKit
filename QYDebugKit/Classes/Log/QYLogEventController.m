//
//  QYLogEventController.m
//  TestDemo
//
//  Created by Yann_Dev on 2023/8/31.
//

#import "QYLogEventController.h"
#import "QYDebugManager.h"
#import "QYLogEventManager.h"

@interface QYLogEventController () <UITextViewDelegate>

@property(nonatomic, strong) UIStackView *stackView;
@property(nonatomic, strong) UITextView *textview;



@end

@implementation QYLogEventController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.view addSubview:self.textview];
    [self.view addSubview:self.stackView];
    self.stackView.frame = CGRectMake(0, CGRectGetMaxY(self.textview.frame), self.view.bounds.size.width, 100);
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"清空log" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.backgroundColor = UIColor.orangeColor;
    [btn addTarget:self action:@selector(clearLog) forControlEvents:UIControlEventTouchUpInside];
    
    [self.stackView addArrangedSubview:btn];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *contenStr = QYDebugManager.shareInstance.logEventManager.logContentStr;
    self.textview.text = contenStr;
}

- (void)clearLog {
    [QYDebugManager.shareInstance.logEventManager clearCachedEvent];
    NSString *contenStr = QYDebugManager.shareInstance.logEventManager.logContentStr;
    self.textview.text = contenStr;
}

- (UIStackView *)stackView {
    if (!_stackView) {
        UIStackView *stackView = [[UIStackView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.alignment = UIStackViewAlignmentFill;
        stackView.spacing = 5;
        stackView.backgroundColor = UIColor.whiteColor;
        _stackView = stackView;
    }
    return _stackView;
}

- (UITextView *)textview {
    if (!_textview) {
        UITextView *textview =  [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
        textview.backgroundColor=[UIColor greenColor]; //设置背景色
        textview.scrollEnabled = true;    //设置当文字超过视图的边框时是否允许滑动，默认为“YES”
        textview.editable = NO;        //设置是否允许编辑内容，默认为“YES”
        textview.delegate = self;       //设置代理方法的实现类
        textview.font=[UIFont systemFontOfSize:18.0]; //设置字体名字和字体大小;
        textview.returnKeyType = UIReturnKeyDefault;//设置return键的类型
        textview.keyboardType = UIKeyboardTypeDefault;//设置键盘类型一般为默认
        textview.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
        textview.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
        textview.textColor = [UIColor blackColor];// 设置显示文字颜色
        textview.text = @"埋点事件";//设置显示的文本内容
        
        _textview = textview;
    }
    return _textview;
}
@end
