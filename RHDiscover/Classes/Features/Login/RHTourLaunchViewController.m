//
//  RHTourLaunchViewController.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/24.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTourLaunchViewController.h"
#import "RHPlayerView.h"
#import "RHThirdPartyLoginView.h"
#import "UIView+RHHelp.h"

#define kButtonCornerRadius 22

@interface RHTourLaunchViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (weak, nonatomic) IBOutlet RHPlayerView *playerView;
@property (weak, nonatomic) IBOutlet RHThirdPartyLoginView *thirdPartyLoginView;

@end

@implementation RHTourLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews {
    UIImage *image = [[UIImage imageNamed:@"auth_sign_in_Normal"] stretchableImageWithLeftCapWidth:22 topCapHeight:22];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *registerImage = [[UIImage imageNamed:@"auth_sign_up_Normal"] stretchableImageWithLeftCapWidth:22 topCapHeight:22];
    [self.registerButton setBackgroundImage:registerImage forState:UIControlStateNormal];
    
    self.playerView.url = [[NSBundle mainBundle] URLForResource:@"LaunchTour" withExtension:@"mp4"];
}

- (IBAction)loginAction:(id)sender {
    
}

- (IBAction)registerAction:(id)sender {
    
}

@end
