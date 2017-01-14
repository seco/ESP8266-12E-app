//
//  NextFourViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "NextFourViewController.h"
#import "Header.h"
@interface NextFourViewController ()

@end

@implementation NextFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"I connected to my Smart Plug's Wi-Fi" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:66.0/255.0 green:145.0/255.0 blue:195.0/255.0 alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(SCREENHEIGHT/11)
    .bottomSpaceToView(self.view,SCREENHEIGHT/160);
    
    UIImageView* bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"bag3"];
    [self.view addSubview:bgImage];
    bgImage.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,64)
    .bottomSpaceToView(button,0);
}
-(void)nextBtnClick{
    
    SettingViewController*setting = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
