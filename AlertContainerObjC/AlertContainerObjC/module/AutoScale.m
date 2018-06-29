//
//  AutoScale.m
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import "AutoScale.h"

#pragma mark - Private
#pragma mark -- Size

CGSize screenSize() {
    return [UIScreen mainScreen].bounds.size;
}

CGSize currentModeSize() {
    return [UIScreen mainScreen].currentMode.size;
}

CGSize iPhone6Size() {
    return CGSizeMake(750.0f * 0.5f, 1334.0f * 0.5f);
}

CGSize iPhone5Size() {
    return CGSizeMake(640.0f * 0.5f, 1136.0f * 0.5f);
}

#pragma mark -- 机型

BOOL iPhoneX() {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(1125.0f, 2436.0f), currentModeSize());
    } else {
        return NO;
    }
}

BOOL iPhone4() {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(640.0f, 960.0f), currentModeSize());
    } else {
        return NO;
    }
}

#pragma mark -- 比例缩放

CGFloat autoScaleX() {
    return screenSize().width / iPhone6Size().width;
}

CGFloat autoScaleY() {
    
    if (iPhone4()) {
        return iPhone5Size().height / iPhone6Size().height;
    } else {
        CGFloat height = screenSize().height;
        if (iPhoneX()) {
            height = 667.0f;
        }
        return height / iPhone6Size().height;
    }
}

CGFloat autoScale() {
    return MIN(autoScaleX(), autoScaleY());
}

#pragma mark - Public
#pragma mark -- size, 字体size

inline CGFloat scaleX(CGFloat value) {
    return value * autoScaleX();
}

inline CGFloat scaleY(CGFloat value) {
    return value * autoScaleY();
}

inline UIFont *scaleFontSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:(fontSize) * autoScale()];
}

inline UIFont *scaleBoldFontSize(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:(fontSize) * autoScale()];
}

#pragma mark -- 状态栏，导航栏，Tabbar, 底部

inline CGFloat getStatusBarHeight() {
    return iPhoneX() ? 44 : 20;
}

inline CGFloat getNavigationBarHeight() {
    return 44;
}

inline CGFloat getStatusAndNavBarHeight() {
    return iPhoneX() ? 88 : 64;
}

inline CGFloat getTabBarHeight() {
    return iPhoneX() ? 83 : 49;
}

inline CGFloat getIphoneXInsetBottom() {
    return iPhoneX() ? 34 : 0;
}
