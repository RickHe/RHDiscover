//
//  RHTabBar.h
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/26.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^kCenterButtonSelectedBlock)(UIButton *btn);

@interface RHTabBar : UITabBar

@property(nonatomic, copy) kCenterButtonSelectedBlock centerButtonSelectedBlock;

@end
