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

@property(nonatomic, strong) UITextView *textview;



@end

@implementation QYLogEventController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建一个UIBarButtonItem
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"清空log"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(clearLog)];
    
    // 将UIBarButtonItem设置为导航栏的右侧按钮
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.view addSubview:self.textview];
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



- (UITextView *)textview {
    if (!_textview) {
//        CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        UITextView *textView =  [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        textView.backgroundColor=[UIColor greenColor]; //设置背景色
        textView.scrollEnabled = true;    //设置当文字超过视图的边框时是否允许滑动，默认为“YES”
        textView.editable = NO;        //设置是否允许编辑内容，默认为“YES”
        textView.delegate = self;       //设置代理方法的实现类
        textView.font=[UIFont systemFontOfSize:18.0]; //设置字体名字和字体大小;
        textView.returnKeyType = UIReturnKeyDefault;//设置return键的类型
        textView.keyboardType = UIKeyboardTypeDefault;//设置键盘类型一般为默认
        textView.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
        textView.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
        textView.textColor = [UIColor blackColor];// 设置显示文字颜色
        // 设置UITextView的内容inset
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 100, 0); // 上、左、下、右插入

        
        _textview = textView;
    }
    return _textview;
}
@end

//- (UIStackView *)stackView {
//    if (!_stackView) {
//        UIStackView *stackView = [[UIStackView alloc] initWithFrame:UIScreen.mainScreen.bounds];
//        stackView.axis = UILayoutConstraintAxisVertical;
//        stackView.distribution = UIStackViewDistributionFillEqually;
//        stackView.alignment = UIStackViewAlignmentFill;
//        stackView.spacing = 5;
//        stackView.backgroundColor = UIColor.whiteColor;
//        _stackView = stackView;
//    }
//    return _stackView;
//}
//    [self.view addSubview:self.stackView];
//    self.stackView.frame = CGRectMake(0, CGRectGetMaxY(self.textview.frame), self.view.bounds.size.width, 100);
//
//    UIButton *btn = [[UIButton alloc] init];
//    [btn setTitle:@"清空log" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
//    btn.backgroundColor = UIColor.orangeColor;
//    [btn addTarget:self action:@selector(clearLog) forControlEvents:UIControlEventTouchUpInside];
