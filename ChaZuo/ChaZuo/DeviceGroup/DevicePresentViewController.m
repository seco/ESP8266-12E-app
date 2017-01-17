//
//  DevicePresentViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "DevicePresentViewController.h"
#import "Header.h"
@interface DevicePresentViewController ()

@end

@implementation DevicePresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.title = @"Add Device";
    [self creatDeviceBtn];
    
}
//截取图片
- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}
-(void)creatDeviceBtn{
    NSArray*image = [[NSArray alloc]initWithObjects:@"device",@"device1", nil];
    NSArray*title = [[NSArray alloc]initWithObjects:@"SMART PLUG",@"SMART BULU", nil];
    for (int i = 0; i<2; i++) {

        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i+1;
        [button setTitle:title[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:66.0/255.0 green:145.0/255.0 blue:195.0/255.0 alpha:1] forState:UIControlStateNormal];
        [button setImage:[self image:[UIImage imageNamed:image[i]] byScalingToSize:CGSizeMake((SCREENWIDTH-30)/2.6, (SCREENWIDTH-30)/2.6)] forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0,20,(SCREENWIDTH-30)/2-(SCREENWIDTH-30)/2.5,button.titleLabel.bounds.size.width-20);
        button.titleEdgeInsets = UIEdgeInsetsMake((SCREENWIDTH-30)/2-(SCREENWIDTH-30)/8, -button.titleLabel.bounds.size.width-(SCREENWIDTH-30)/2.5, 0, 0);
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.sd_layout
        .topSpaceToView(self.view,80)
        .leftSpaceToView(self.view,10+(i%2)*(SCREENWIDTH-30)/2)
        .widthIs((SCREENWIDTH-30)/2)
        .heightIs((SCREENWIDTH-30)/2);
      
    }
}
-(void)buttonClick:(UIButton*)button{
    if (button.tag == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:@"device" forKey:@"iconName"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"device1" forKey:@"iconName"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
        NextOneViewController*one = [[NextOneViewController alloc]init];
        [self.navigationController pushViewController:one animated:YES];
   
}
-(void)leftBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
