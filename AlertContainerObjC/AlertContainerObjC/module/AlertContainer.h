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

@property (nonatomic, strong, readonly) UIView *bodyView;
@property (nonatomic, strong, readonly) UIView *bottomView;

- (instancetype)initAlertWithSuperView:(UIView *)superView
                              bodyView:(UIView *)bodyView
                            bottomView:(UIView *)bottomView;

- (void)show;
- (void)dismiss;

@end
