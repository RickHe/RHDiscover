//
//  RHBaseViewController.m
//  RHDiscover
//
//  Created by DaFenQI on 2018/4/24.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHBaseViewController.h"

@interface RHBaseViewController ()

@end

@implementation RHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:(random() % 255) / 255.0  green:(random() % 255) / 255.0 blue:(random() % 255) / 255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
