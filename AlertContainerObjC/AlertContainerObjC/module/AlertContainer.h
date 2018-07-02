//
//  AlertContainer.h
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "AutoScale.h"
#import "Utils.h"

#define kAlertMaxContainerWidth (295.0f)

@interface AlertContainer : UIView

@property (nonatomic, strong, readonly) UIView *containerView;

- (instancetype)initAlertWithSuperView:(UIView *)superView
                         containerView:(UIView *)containerView;

- (void)show;
- (void)dismiss;

@end
