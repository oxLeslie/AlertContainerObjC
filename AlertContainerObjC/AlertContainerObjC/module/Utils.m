//
//  Utils.m
//  AlertContainerObjC
//
//  Created by xiaoniu on 2018/6/29.
//  Copyright © 2018年 AAAma. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (CGSize)calculateCompressedSize:(UIView *)view {
    [view setNeedsLayout];
    [view layoutIfNeeded];
    
    return [view systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}
@end
