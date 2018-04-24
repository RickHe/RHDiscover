//
//  UIView+RHHelp.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/24.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "UIView+RHHelp.h"

@implementation UIView (RHHelp)

- (void)rh_setDefaultLayerCorner {
    
}

- (void)rh_setLayerCorner:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
//    self.layer.borderColor = [kUIColorFromRGB(BoardLineColor) CGColor];
    self.layer.borderWidth = 0.f;
}

@end
