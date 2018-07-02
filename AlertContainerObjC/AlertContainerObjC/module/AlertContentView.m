//
//  AlertContentView.m
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import "AlertContentView.h"

@interface AlertContentView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UIView *horizontalLine;
@property (nonatomic, strong) UIView *verticalLine;
@end

@implementation AlertContentView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubView];
        [self setupConstraint];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubView {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = scaleX(10.0f);
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.messageLabel];
    
    [self addSubview:self.horizontalLine];
    [self addSubview:self.verticalLine];
    
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    
}

- (void)setupConstraint {
    CGFloat width = [self viewWidth];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(scaleY(24.0f));
        make.centerX.equalTo(self);
        make.width.mas_equalTo(width);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(scaleY(10.0f));
        make.centerX.equalTo(self);
        make.width.mas_equalTo(width);
    }];
    
    [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.messageLabel.mas_bottom).offset(scaleY(20.0f));
        make.width.mas_equalTo(kAlertMaxContainerWidth);
        make.height.mas_equalTo(0.5f);
    }];
    
    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.horizontalLine.mas_bottom);
        make.height.mas_equalTo(scaleY(44.0f));
        make.width.mas_equalTo(0.5f);
    }];
    
    CGFloat w = (kAlertMaxContainerWidth - 0.5) * 0.5;
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.horizontalLine.mas_bottom);
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(scaleY(44.0f));
        make.bottom.equalTo(self);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verticalLine.mas_right);
        make.top.equalTo(self.leftButton);
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(scaleY(44.0f));
    }];
}

#pragma mark - Public

- (void)setupTitle:(NSString *)title message:(NSString *)message {
    self.titleLabel.text = title;
    self.messageLabel.text = message;
    
}

#pragma mark - Private

- (CGFloat)viewWidth {
    return scaleX(kAlertMaxContainerWidth - 56.0f);
}

#pragma mark - Property

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = scaleFontSize(18.0f);
        _titleLabel.textColor = HEXCOLOR(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = scaleFontSize(13.5f);
        _messageLabel.textColor = HEXCOLOR(0x333333);
        
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _messageLabel;
}

- (UIView *)horizontalLine {
    if (!_horizontalLine) {
        _horizontalLine = [[UIView alloc] init];
        _horizontalLine.backgroundColor = HEXCOLOR(0xE4E4E4);
    }
    return _horizontalLine;
}

- (UIView *)verticalLine {
    if (!_verticalLine) {
        _verticalLine = [[UIView alloc] init];
        _verticalLine.backgroundColor = HEXCOLOR(0xE4E4E4);
    }
    return _verticalLine;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.tag = 0;
        [_leftButton setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.tag = 1;
        [_rightButton setTitleColor:HEXCOLOR(0x479DF6) forState:UIControlStateNormal];
    }
    return _rightButton;
}

@end
