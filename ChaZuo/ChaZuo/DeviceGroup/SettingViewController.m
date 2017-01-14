//
//  SettingViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/13.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "SettingViewController.h"
#import "Header.h"
@interface SettingViewController ()<UITextFieldDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Preconfigured device";
    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"chongzhi"] forState:UIControlStateNormal];
    button.tag = 100;
    [button addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .bottomSpaceToView(self.view,SCREENHEIGHT/4);
    
    UIButton*button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"not reset"] forState:UIControlStateNormal];
    button1.tag = 101;
    [button1 addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .topSpaceToView(button,30);

    
    UIImageView* bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:bgImage];
    bgImage.sd_layout
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .topSpaceToView(self.view,90)
    .heightIs(SCREENHEIGHT/4);
    
    UITextField*tf = [[UITextField alloc]init];
    tf.placeholder = @" DEVICE NAME";
    tf.delegate = self;
    tf.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tf];
    tf.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .topSpaceToView(bgImage,20);
    

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"name"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [textField resignFirstResponder];
    return YES;
}
-(void)nextBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
