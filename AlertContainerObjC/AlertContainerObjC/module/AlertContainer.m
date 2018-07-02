//
//  AlertContainer.m
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import "AlertContainer.h"

@interface AlertContainer ()

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *superView;
@end

@implementation AlertContainer

- (void)dealloc {
    NSLog(@"AlertView has dealloc!");
}

- (instancetype)initAlertWithSuperView:(UIView *)superView
                         containerView:(UIView *)containerView {
    if (self = [super init]) {
        _superView = superView;
        _containerView = containerView;
        
        [self setupSubView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubView {
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.maskView];
    
    if (self.containerView) {
        [self addSubview:self.containerView];
    }
    
    [self.superView addSubview:self];
}

- (void)setupConstraints {
    
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.superView);
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    if (self.containerView) {
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.mas_equalTo(scaleX(kAlertMaxContainerWidth));
        }];
    }
}

#pragma mark - Public

- (void)show {
    if (self.containerView) {
        self.containerView.alpha = 0.000001f;
        self.containerView.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
        [UIView animateWithDuration:0.4f
                              delay:0.0f
             usingSpringWithDamping:0.65f
              initialSpringVelocity:0.0f
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.maskView.alpha = 1.0f;
                             self.containerView.alpha = 1.0f;
                             self.containerView.transform = CGAffineTransformIdentity;
                         } completion:nil];
    }
}

- (void)dismiss {
    [UIView animateWithDuration:0.25f
                     animations:^{
                         self.maskView.alpha = 0.000001f;
                         self.containerView.alpha = 0.000001f;
                         self.containerView.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

#pragma mark - Property

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
        _maskView.alpha = 0.000001f;
    }
    return _maskView;
}

@end
