//
//  RHThirdPartyLoginView.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/24.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHThirdPartyLoginView.h"
#import <Masonry/Masonry.h>
#import "common.h"

#define kButtonHeight 16
#define kButtonNormalWidth 80
#define kButtonFacebookWith 126
#define kImageEdgeInset UIEdgeInsetsMake(0, 0, 0, 8)

typedef NS_ENUM(NSUInteger, kLoginButtonType) {
    kLoginButtonTypeWechat = 1,
    kLoginButtonTypeQQ,
    kLoginButtonTypeMore,
    kLoginButtonTypeWeibo,
    kLoginButtonTypeFacebook
};

@interface RHThirdPartyLoginView ()

@property (nonatomic, assign) BOOL isShowAllLoginButton;

@end

@implementation RHThirdPartyLoginView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _isShowAllLoginButton = NO;
    
    [self setButton:kLoginButtonTypeWechat
              image:[UIImage imageNamed:@"login_wechat_Normal"]
              title:RHLocalizedString(@"微信")];
    [self setButton:kLoginButtonTypeQQ
              image:[UIImage imageNamed:@"login_QQ_Normal"]
              title:RHLocalizedString(@"QQ")];
    [self setButton:kLoginButtonTypeMore
              image:[UIImage imageNamed:@"icon_more_white_25_Normal"]
              title:RHLocalizedString(@"更多")];
    [self setButton:kLoginButtonTypeWeibo
              image:[UIImage imageNamed:@"login_weibo_Normal"]
              title:RHLocalizedString(@"微博")];
    [self setButton:kLoginButtonTypeFacebook
              image:[UIImage imageNamed:@"login_facebook_Normal"]
              title:RHLocalizedString(@"facebook")];
}

- (UIButton *)setButton:(NSInteger)tag
                  image:(UIImage *)image
                  title:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.tag = tag;
    btn.imageEdgeInsets = kImageEdgeInset;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];
    
    [btn addTarget:self
            action:@selector(buttonAction:)
  forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)buttonAction:(UIButton *)btn {
    switch (btn.tag) {
        case kLoginButtonTypeWechat: {
            
            break;
        }
        case kLoginButtonTypeQQ: {
            
            break;
        }
        case kLoginButtonTypeMore: {
            self.isShowAllLoginButton = YES;
            break;
        }
        case kLoginButtonTypeWeibo: {
            
            break;
        }
        case kLoginButtonTypeFacebook: {
            
            break;
        }
        default:
            break;
    }
}

- (void)setIsShowAllLoginButton:(BOOL)isShowAllLoginButton {
    _isShowAllLoginButton = isShowAllLoginButton;
    
    CGFloat buttonInterSpacing = 0;
    if (_isShowAllLoginButton) {
        buttonInterSpacing = (kRHSreenWidth - kButtonNormalWidth * 3 - kButtonFacebookWith) / 5;
    } else {
        buttonInterSpacing = (kRHSreenWidth - kButtonNormalWidth * 3) / 4;
    }
    
    UIButton *wechatButton = [self viewWithTag:kLoginButtonTypeWechat];
    [wechatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(buttonInterSpacing);
        make.width.mas_equalTo(kButtonNormalWidth);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(kButtonHeight);
    }];
    
    UIButton *qqButton = [self viewWithTag:kLoginButtonTypeQQ];
    [qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wechatButton.mas_right).offset(buttonInterSpacing);
        make.width.mas_equalTo(kButtonNormalWidth);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(kButtonHeight);
    }];
    
    if (_isShowAllLoginButton) {
        UIButton *weiboButton = [self viewWithTag:kLoginButtonTypeWeibo];
        [weiboButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(qqButton.mas_right).offset(buttonInterSpacing);
            make.width.mas_equalTo(kButtonNormalWidth);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kButtonHeight);
        }];
        
        UIButton *facebookButton = [self viewWithTag:kLoginButtonTypeFacebook];
        [facebookButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weiboButton.mas_right).offset(buttonInterSpacing);
            make.width.mas_equalTo(kButtonNormalWidth);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kButtonHeight);
        }];
        
        [[self viewWithTag:kLoginButtonTypeMore] mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
            make.left.equalTo(facebookButton.mas_right).offset(buttonInterSpacing);
            make.centerY.equalTo(self);
        }];
    } else {
        UIButton *moreButton = [self viewWithTag:kLoginButtonTypeMore];
        [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(qqButton.mas_right).offset(buttonInterSpacing);
            make.width.mas_equalTo(kButtonNormalWidth);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kButtonHeight);
        }];
        
        [[self viewWithTag:kLoginButtonTypeWeibo] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
            make.left.equalTo(moreButton.mas_right).offset(buttonInterSpacing);
            make.centerY.equalTo(self);
        }];
        
        [[self viewWithTag:kLoginButtonTypeFacebook] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
            make.left.equalTo(moreButton.mas_right).offset(buttonInterSpacing);
            make.centerY.equalTo(self);
        }];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_isShowAllLoginButton) {
        self.isShowAllLoginButton = NO;
    }
}

@end
