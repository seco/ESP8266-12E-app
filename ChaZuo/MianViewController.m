//
//  MianViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "MianViewController.h"
#import "Header.h"

@interface MianViewController ()
{
    NSInteger tempIndex;
}
@end

@implementation MianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"Home";
  
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    [self creatBtn];
   
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

-(void)creatBtn{
    NSArray*title = [[NSArray alloc]initWithObjects:@"Scenes",@"Devices", nil];
    NSArray*image = [[NSArray alloc]initWithObjects:@"selectFirst",@"SelectSecond", nil];
    NSArray*unimage = [[NSArray alloc]initWithObjects:@"unSelectFirst",@"unSelectSecond", nil];
    for (int i = 0; i<2; i++) {
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i+1;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 0.5;
        [button setTitle:title[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:66.0/255.0 green:145.0/255.0 blue:195.0/255.0 alpha:1] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
       
        [button setImage:[self image:[UIImage imageNamed:image[i]] byScalingToSize:CGSizeMake(SCREENHEIGHT/20, SCREENHEIGHT/20)] forState:UIControlStateSelected];
        [button setImage:[self image:[UIImage imageNamed:unimage[i]] byScalingToSize:CGSizeMake(SCREENHEIGHT/20, SCREENHEIGHT/20)] forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0,33,21,button.titleLabel.bounds.size.width-20);
        button.titleEdgeInsets = UIEdgeInsetsMake(SCREENHEIGHT/11-SCREENHEIGHT/20, -button.titleLabel.bounds.size.width-50, 0, 0);
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.sd_layout
        .bottomEqualToView(self.view)
        .leftSpaceToView(self.view,(i%2)*SCREENWIDTH/2)
        .widthIs(SCREENWIDTH/2)
        .heightIs(SCREENHEIGHT/11);
        if (i == 1) {
            button.selected = YES;
            tempIndex = button.tag;
            
            DeviceShowViewController*dev = [[DeviceShowViewController alloc]init];
             dev.view.frame = CGRectMake(0,64, SCREENWIDTH, SCREENHEIGHT-SCREENHEIGHT/11-64);
            [self addChildViewController:dev];
            [self.view addSubview:dev.view];
        }
        
    }
}
//底部按钮点击事件
-(void)btnClick:(UIButton*)button{
   
    for (UIViewController*view in self.childViewControllers) {
        [view removeFromParentViewController];
    }
    UIButton*btn = [self.view viewWithTag:tempIndex];
    btn.selected = NO;
    button.selected = YES;
    tempIndex = button.tag;
    
 
    //判断是哪一个按钮
    if (button.tag == 1) {
        [[self.navigationController.navigationBar.subviews objectAtIndex:2] setHidden:YES];
        SceneViewController*scen = [[SceneViewController alloc]init];
        scen.view.frame = CGRectMake(0,64, SCREENWIDTH, SCREENHEIGHT-64-SCREENHEIGHT/11);

        [self.view addSubview:scen.view];
        [self addChildViewController:scen];
        
    }else{
        [[self.navigationController.navigationBar.subviews objectAtIndex:2] setHidden:NO];
        DeviceShowViewController*dev = [[DeviceShowViewController alloc]init];
         dev.view.frame = CGRectMake(0,64, SCREENWIDTH, SCREENHEIGHT-SCREENHEIGHT/11-64);
        
        [self.view addSubview:dev.view];
        [self addChildViewController:dev];
        

    }
}
//右边按钮的点击事件
-(void)rightBtnClick{
    if (tempIndex == 1) {
        NSLog(@"----scenes----");
    }else{
        DevicePresentViewController*device = [[DevicePresentViewController alloc]init];
        UINavigationController*nav = [[UINavigationController alloc]initWithRootViewController:device];
        [self presentViewController:nav animated:YES completion:nil];

    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
