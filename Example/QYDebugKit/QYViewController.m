//
//  QYViewController.m
//  QYDebugKit
//
//  Created by YannChee on 12/05/2023.
//  Copyright (c) 2023 YannChee. All rights reserved.
//

#import "QYViewController.h"
#if DEBUG
#import <QYDebugKit/QYDebugManager.h>
#endif


@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.systemPinkColor;
    
    

#if DEBUG
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectZero];
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"测试Btn" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.layer.cornerRadius = 24.;
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    
    [QYDebugManager.shareInstance initDenugSDKWithStartingPosition:CGPointMake(0, 300) customFunctionButtons:@[btn] completion:^{
        NSLog(@"QYDebugManager init Success");
    }];
#endif

}

- (void)test {
    
}

int a = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [QYDebugManager.shareInstance logEventName:@(a++).stringValue content:@""];
    [QYDebugManager.shareInstance logEventName:@(a++).stringValue paramDict:@{@"count" : @(a)}];
}

@end
