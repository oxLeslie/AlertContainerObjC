//
//  ViewController.m
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import "ViewController.h"
#import "AlertContainer.h"
#import "AlertContentView.h"

@interface ViewController ()
@property (nonatomic, strong) AlertContainer *alertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *tap = [[UIButton alloc] init];
    tap.bounds = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    tap.center = self.view.center;
    [tap setTitle:@"tap" forState:UIControlStateNormal];
    [tap setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [tap addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tap];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap {
    [self showWithSuperView:self.view];
}

// usage
- (void)showWithSuperView:(UIView *)superView {
    
    NSString *title = @"Alert";
    NSString *message = @"AlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainerAlertContainer!";
    NSString *cancelTitle = @"cancel";
    NSString *confirmTitle = @"confirm";
    
    AlertContentView *view = [[AlertContentView alloc] init];
    
    view.messageLabel.textAlignment = NSTextAlignmentCenter;
    [view setupTitle:title message:message];
    
    [view.leftButton setTitle:cancelTitle forState:UIControlStateNormal];
    [view.rightButton setTitle:confirmTitle forState:UIControlStateNormal];
    
    [view.leftButton addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.rightButton addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.alertView = [[AlertContainer alloc] initAlertWithSuperView:superView containerView:view];
    [self.alertView show];
}

- (void)buttonDidClicked:(UIButton *)button {
    [self.alertView dismiss];
    self.alertView = nil;
}


@end
