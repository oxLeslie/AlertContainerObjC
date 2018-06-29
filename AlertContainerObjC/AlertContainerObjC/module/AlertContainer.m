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
@property (nonatomic, strong) UIView *bodyView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *superView;
@end

@implementation AlertContainer

- (void)dealloc {
    NSLog(@"XNLAlertView has dealloc!");
}

- (instancetype)initAlertWithSuperView:(UIView *)superView
                              bodyView:(UIView *)bodyView
                            bottomView:(UIView *)bottomView {
    if (self = [super init]) {
        _superView = superView;
        _bodyView = bodyView;
        _bottomView = bottomView;
        
        [self setupSubView];
        [self updateAlerViewConstraints];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubView {
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.maskView];
    [self addSubview:self.containerView];
    
    [self.containerView addSubview:self.bodyView];
    [self.containerView addSubview:self.bottomView];
    
    [self.superView addSubview:self];
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.superView);
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    CGFloat height = [Utils calculateCompressedSize:self.bodyView].height;
    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.containerView);
        make.width.mas_equalTo(scaleX(kAlertMaxContainerWidth));
        make.height.mas_equalTo(height);
    }];
}

- (void)updateAlerViewConstraints {
    
    CGFloat bottomViewHeight = [Utils calculateCompressedSize:self.bottomView].height;
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (self.bodyView) {
            make.top.equalTo(self.bodyView.mas_bottom);
        } else {
            make.top.equalTo(self.containerView);
        }
        
        make.left.equalTo(self.containerView);
        make.width.mas_equalTo(scaleX(kAlertMaxContainerWidth));
        make.height.mas_equalTo(bottomViewHeight);
        make.bottom.equalTo(self.containerView).priorityLow();
        
    }];
    
    CGFloat containerHeight = [Utils calculateCompressedSize:self.containerView].height;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(scaleX(kAlertMaxContainerWidth), containerHeight));
    }];
}

#pragma mark - Public

- (void)show {
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

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.layer.cornerRadius = scaleX(12.0f);
        _containerView.layer.masksToBounds = YES;
        _containerView.clipsToBounds = YES;
        
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

@end
