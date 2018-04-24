//
//  RHRouter.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/24.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHRouter.h"
#import "RHTourLaunchViewController.h"
#import "AppDelegate.h"

@implementation RHRouter

+ (void)switchToTourLaunchViewController {
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nil;
    RHTourLaunchViewController *tourLaunchVC = [[RHTourLaunchViewController alloc]init];
    [RHRouter showViewController:tourLaunchVC];
}

+(void)showViewController:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}

@end
