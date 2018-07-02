//
//  AlertContentView.h
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertContainer.h"

@interface AlertContentView : UIView
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *messageLabel;

@property (nonatomic, strong, readonly) UIButton *leftButton;
@property (nonatomic, strong, readonly) UIButton *rightButton;

- (void)setupTitle:(NSString *)title message:(NSString *)message;
@end
