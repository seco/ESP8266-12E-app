//
//  DeviceShowViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "DeviceShowViewController.h"
#import "Header.h"
@interface DeviceShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView*bgImage;
    NSMutableArray*lightArr;
}
@property(nonatomic,strong)UITableView*tab;
@end

@implementation DeviceShowViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    lightArr = [[NSMutableArray alloc]initWithCapacity:0];
    NSString*name = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    if (!name) {
        bgImage.hidden = NO;
        _tab.hidden = YES;
    }else{
        bgImage.hidden = YES;
        _tab.hidden = NO;
        [lightArr addObject:@""];
        
    }
    [_tab reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
        bgImage = [[UIImageView alloc]init];
        bgImage.image = [UIImage imageNamed:@"bg"];
        [self.view addSubview:bgImage];
        bgImage.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topSpaceToView(self.view,0)
        .bottomSpaceToView(self.view,SCREENHEIGHT/11+10);
  
        [self creatTableView];
}

-(void)creatTableView{
   
        _tab = [[UITableView alloc]init];
        _tab.delegate = self;
        _tab.dataSource = self;
        [self.view addSubview:_tab];
        _tab.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topSpaceToView(self.view,0)
        .bottomSpaceToView(self.view,SCREENHEIGHT/11+10);
   
    
    

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*flag = @"cellId";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
        
        UIImageView*image = [[UIImageView alloc]init];
        image.tag = 1;
        [cell addSubview:image];
        image.sd_layout
        .leftSpaceToView(cell,30)
        .topSpaceToView(cell,5)
        .bottomSpaceToView(cell,5)
        .widthIs(50);
        
        UILabel*lab = [[UILabel alloc]init];
        lab.tag = 2;
        [cell addSubview:lab];
        lab.sd_layout
        .leftSpaceToView(image,20)
        .topEqualToView(image)
        .bottomEqualToView(image)
        .rightSpaceToView(cell,0);
        
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 3;
        [cell addSubview:button];
        button.sd_layout
        .rightSpaceToView(cell,40)
        .topSpaceToView(cell,10)
        .bottomSpaceToView(cell,10)
        .widthEqualToHeight();
        
    }
    
    UIImageView*img = [cell viewWithTag:1];
    img.image = [UIImage imageNamed:@"pic1"];
    
    UILabel*lab = [cell viewWithTag:2];
    lab.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    
    UIButton*button = [cell viewWithTag:3];
    [button addTarget:self action:@selector(buttonClick: ) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"open"] forState:UIControlStateSelected];
    
    
    return cell;
}
-(void)buttonClick:(UIButton*)button{
    if (!button.selected) {
        UIAlertController*alert = [UIAlertController alertControllerWithTitle:@"手动填写pin" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
           
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
        }];
        
        UIAlertAction*action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UITextField *userPin = alert.textFields.firstObject;// 填写pin脚
            UITextField *userIp = alert.textFields.lastObject;//填写IP
            
//------------------------socket通信----------------------------
//            [[NSUserDefaults standardUserDefaults] setObject:userPin.text forKey:@"user"];
//            [[NSUserDefaults standardUserDefaults] setObject:userIp.text forKey:@"userIp"];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//            button.selected = YES;
//            //开关打开 发送数据
//            MySocket *socket = [MySocket sharedInstance];
//            socket.socketPort = 53239;//端口号
//            socket.pin = userPin.text ;
//            socket.state = @"1";//开关打开
//            socket.socketHost = userIp.text;//主机号
//            [socket socketConnectHost];//连接
//-----------------------webSever通信----------------------------
            //发送post请求
            
        }];
        [alert addAction:action];
        
        UIAlertAction*action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action1];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        button.selected = NO;
        //开关关闭 断开连接
        
//-------------------------socket通信----------------------------
//        MySocket *socket = [MySocket sharedInstance];
//        socket.socketPort = 53239;//端口号
//        socket.pin = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
//        socket.state = @"0";//开关关闭
//        socket.socketHost = [[NSUserDefaults standardUserDefaults] objectForKey:@"userIp"];;//主机号
//        [socket socketConnectHost];//连接
        
        
        
//-----------------------webSever通信----------------------------
        //发送post请求
    }
    
    
   
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView setEditing:YES animated:YES];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //删除名字
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"name"];
    //隐藏列表
    _tab.hidden = YES;
    //显示图片
    bgImage.hidden = NO;
    //刷新列表
    [lightArr removeObjectAtIndex:0];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return lightArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
