//
//  NextThreeViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "NextThreeViewController.h"
#import "Header.h"
@interface NextThreeViewController ()

@end

@implementation NextThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
   [button setBackgroundImage:[UIImage imageNamed:@"nextBtn"] forState:UIControlStateNormal];
   
    [button addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .bottomSpaceToView(self.view,SCREENHEIGHT/11);
    
    UIImageView* bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"bag2"];
    [self.view addSubview:bgImage];
    bgImage.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view,90)
    .bottomSpaceToView(button,0);
}
-(void)nextBtnClick{
    NextFourViewController*one = [[NextFourViewController alloc]init];
    [self.navigationController pushViewController:one animated:YES];
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
