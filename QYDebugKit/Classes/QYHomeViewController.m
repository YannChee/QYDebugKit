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


@interface QYHomeViewController ()


@end

@implementation QYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    
    
    QYLogEventController *logVC = [QYLogEventController new];
    [self addChildViewController:logVC];
    [self.view addSubview:logVC.view];
}



@end
