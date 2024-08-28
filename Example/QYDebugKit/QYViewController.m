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
    [QYDebugManager.shareInstance initDenugSDKWithStartingPosition:CGPointMake(0, 300) completion:^{
        NSLog(@"QYDebugManager init Success");
    }];
#endif

}


int a = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [QYDebugManager.shareInstance logEventName:@(a++).stringValue content:@""];
    [QYDebugManager.shareInstance logEventName:@(a++).stringValue paramDict:@{@"count" : @(a)}];
}

@end
