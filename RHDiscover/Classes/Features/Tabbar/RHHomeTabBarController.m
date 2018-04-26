//
//  RHHomeTabBarController.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/25.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHHomeTabBarController.h"

#import "RHBaseViewController.h"
#import "RHBaseNavigationController.h"
#import "RHMediaProduceViewController.h"
#import "RHRNStoreViewController.h"
#import "RHMyViewController.h"
#import "RHMessageCenterViewController.h"
#import "RHPageViewController.h"

#import "RHTabBar.h"
#import "UIImage+RHHelp.h"

@interface RHHomeTabBarController ()

@end

@implementation RHHomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    
    [self addChildVC:[RHPageViewController class]
               title:RHLocalizedString(@"首页")
               image:@"xyvg_tabbar_icon_home_Normal"
       selectedImage:@"xyvg_tabbar_icon_home_selected_Normal"];
    
    [self addChildVC:[RHRNStoreViewController class]
               title:RHLocalizedString(@"商城")
               image:@"xyvg_tabbar_icon_store_Normal"
       selectedImage:@"xyvg_tabbar_icon_store_selected_Normal"];
    
    [self addChildVC:[RHMessageCenterViewController class]
               title:RHLocalizedString(@"消息")
               image:@"xyvg_tabbar_icon_message_Normal"
       selectedImage:@"xyvg_tabbar_icon_message_selected_Normal"];
    
    [self addChildVC:[RHMyViewController class]
               title:RHLocalizedString(@"我")
               image:@"xyvg_tabbar_icon_me_Normal"
       selectedImage:@"xyvg_tabbar_icon_me_selected_Normal"];
    
    RHTabBar *tabBar = [RHTabBar new];
    [self setValue:tabBar forKey:@"tabBar"];
    
    [[RHTabBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];

    [RHTabBar appearance].translucent = NO;
    
    __weak __typeof(self)weakSelf = self;
    tabBar.centerButtonSelectedBlock = ^(UIButton *btn) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
    };
}

- (void)addChildVC:(Class)vcClass
             title:(NSString *)title
             image:(NSString *)image
     selectedImage:(NSString *)selectImage {
    RHBaseViewController *vc = [[vcClass alloc] init];
    UITabBarItem *tabBarItem = vc.tabBarItem;
    tabBarItem.title = title;
    
    NSDictionary *normalTextAttributes = @{
                                           NSFontAttributeName : [UIFont systemFontOfSize:10],
                                           NSForegroundColorAttributeName : [UIColor grayColor],
                                           };
    [tabBarItem setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    NSDictionary *selectedTextAttributes = @{
                                             NSFontAttributeName : [UIFont systemFontOfSize:10],
                                             NSForegroundColorAttributeName : [UIColor blackColor],
                                             };
    [tabBarItem setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    
    tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    RHBaseNavigationController *navi = [[RHBaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navi];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
