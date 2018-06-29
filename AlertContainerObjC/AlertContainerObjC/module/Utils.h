//
//  Utils.h
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils: NSObject
+ (CGSize)calculateCompressedSize:(UIView *)view;
@end

#define RGBCOLOR(r,g,b) \
[UIColor colorWithRed:(r)/255.0f \
green:(g)/255.0f \
blue:(b)/255.0f \
alpha:1]

#define RGBACOLOR(r,g,b,a) \
[UIColor colorWithRed:(r)/255.0f \
green:(g)/255.0f \
blue:(b)/255.0f \
alpha:(a)]

#define HEXCOLOR(hex) \
RGBCOLOR((float)((hex & 0xFF0000) >> 16), \
(float)((hex & 0xFF00) >> 8), \
(float)(hex & 0xFF))

#define HEXACOLOR(hex, a) \
RGBACOLOR((float)((hex & 0xFF0000) >> 16), \
(float)((hex & 0xFF00) >> 8), \
(float)(hex & 0xFF), a)
