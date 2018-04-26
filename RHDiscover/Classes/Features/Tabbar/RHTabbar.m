//
//  RHTabBar.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/26.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTabBar.h"
#import "RHTab.h"

@interface RHTabBar () {
    UIButton *_centerButton;
}

@end

@implementation RHTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _centerButton = [[UIButton alloc] init];
    [_centerButton setImage:[UIImage imageNamed:@"tab_camera_h_Normal"] forState:UIControlStateNormal];
    [_centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _centerButton.adjustsImageWhenHighlighted = NO;
    [self addSubview:_centerButton];
}

- (void)centerButtonAction:(UIButton *)btn {
    if (self.centerButtonSelectedBlock) {
        self.centerButtonSelectedBlock(btn);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width / 5;
    CGFloat height = self.bounds.size.height;
    _centerButton.frame = CGRectMake(0, 0, width, height);
    _centerButton.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

    // 调整默认按钮 frame
    for (int i = 0, j = 0; i < self.subviews.count; i++) {
        UIView *subview = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([subview isKindOfClass:class]) {
            CGRect frame = subview.frame;
            frame.size.width = self.bounds.size.width / 5.0;
            if (j >= 2) {
                frame.origin.x = frame.size.width * (j + 1);
            } else {
                frame.origin.x = frame.size.width * j;
            }
            subview.frame = frame;
            j++;
        }
    }
}

@end
