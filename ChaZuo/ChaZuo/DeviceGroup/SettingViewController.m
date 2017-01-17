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
{
    NSMutableArray*deviceArr;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Preconfigured device";
    
    
    deviceArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"chongzhi"] forState:UIControlStateNormal];
    button.tag = 100;
    [button addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .bottomSpaceToView(self.view,SCREENHEIGHT/5);
    
    UIButton*button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"not reset"] forState:UIControlStateNormal];
    button1.tag = 101;
    [button1 addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .topSpaceToView(button,20);

    
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
    tf.tag = 200;
    tf.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tf];
    tf.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .topSpaceToView(bgImage,20);
    
    UITextField*tf1 = [[UITextField alloc]init];
    tf1.placeholder = @"ADRESS";
    tf1.delegate = self;
    tf1.tag = 201;
    tf1.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:tf1];
    tf1.sd_layout
    .leftSpaceToView(self.view,30)
    .rightSpaceToView(self.view,30)
    .heightIs(SCREENHEIGHT/11)
    .topSpaceToView(tf,20);
    

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)nextBtnClick:(UIButton*)button{
    

    UITextField*tf = [self.view viewWithTag:200];
    UITextField*tf1 = [self.view viewWithTag:201];
    NSString *icon = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconName"];
    DeviceModel*model = [[DeviceModel alloc]initWithDevice:tf.text Adress:tf1.text image:icon];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"device" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@(button.tag),@"tag",model,@"model", nil]];
    
    
    
    if (button.tag == 101) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
   
    if (tf.text.length == 0 || tf1.text.length == 0) {
         UIAlertController*alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"设备名称和IP地址不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
  }
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
