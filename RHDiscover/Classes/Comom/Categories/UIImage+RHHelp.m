//
//  UIImage+RHHelp.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/26.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "UIImage+RHHelp.h"

@implementation UIImage (RHHelp)

// 获取一张颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) {
        return nil;
    }
    
    CGRect rect = {CGPointZero, size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
