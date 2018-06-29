//
//  AutoScale.h
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import <UIKit/UIKit.h>

BOOL iPhoneX(void);

#pragma mark -- size, 字体size

/** X 缩放 */
CGFloat scaleX(CGFloat value);

/** Y 缩放 */
CGFloat scaleY(CGFloat value);

/** 字体 缩放 */
UIFont *scaleFontSize(CGFloat fontSize);

/** 粗体字体 缩放 */
UIFont *scaleBoldFontSize(CGFloat fontSize);

#pragma mark -- 状态栏，导航栏，Tabbar, 底部

CGFloat getStatusBarHeight(void);
CGFloat getNavigationBarHeight(void);
CGFloat getStatusAndNavBarHeight(void);
CGFloat getTabBarHeight(void);
CGFloat getIphoneXInsetBottom(void);
