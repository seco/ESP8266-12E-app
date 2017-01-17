//
//  DeviceShowViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "DeviceShowViewController.h"
#import "Header.h"
#import "Request.h"
@interface DeviceShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView*bgImage;
    NSMutableArray*lightArr;
    NSMutableArray*iconArr;
    
}
@property(nonatomic,strong)UITableView*tab;
@end

@implementation DeviceShowViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"----%@",NSHomeDirectory());
    [lightArr removeAllObjects];
   NSArray*arr = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/device.plist"]];
    if (arr.count!=0) {
        [lightArr addObjectsFromArray:arr];
        bgImage.hidden = YES;
        _tab.hidden = NO;
        [_tab reloadData];
    }else{
            bgImage.hidden = NO;
            _tab.hidden = YES;
        }
    

 
    
}
-(void)getDevice:(NSNotification*)notify{
   NSInteger number = [[notify.userInfo objectForKey:@"tag"] integerValue];
    if (number == 101) {
        return;
    }else{
    DeviceModel*model = [notify.userInfo objectForKey:@"model"];
    [lightArr addObject:model];
        
    [NSKeyedArchiver archiveRootObject:lightArr toFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/device.plist"]];
    }
     [_tab reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
       lightArr = [[NSMutableArray alloc]initWithCapacity:0];
        bgImage = [[UIImageView alloc]init];
        bgImage.image = [UIImage imageNamed:@"bg"];
        [self.view addSubview:bgImage];
        bgImage.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topSpaceToView(self.view,0)
        .bottomSpaceToView(self.view,SCREENHEIGHT/11);
  
        [self creatTableView];
    
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getDevice:) name:@"device" object:nil];
    
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
        .leftSpaceToView(cell,10)
        .topSpaceToView(cell,10)
        .bottomSpaceToView(cell,10)
        .widthEqualToHeight();
        
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
    DeviceModel*model = [lightArr objectAtIndex:indexPath.row];
    
    UIImageView*img = [cell viewWithTag:1];
    img.image = [UIImage imageNamed:model.imageIcon];
    
    UILabel*lab = [cell viewWithTag:2];
    lab.text = model.deviceName;
    UIButton*button = [cell viewWithTag:3];
    [button addTarget:self action:@selector(buttonClick: ) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"open"] forState:UIControlStateSelected];
    
    
    return cell;
}
-(void)buttonClick:(UIButton*)button{
    
    UITableViewCell*cell = (UITableViewCell*)[button superview];
    NSIndexPath*path = [_tab indexPathForCell:cell];
    DeviceModel*model = [lightArr objectAtIndex:path.row];

    if ([model.imageIcon isEqualToString:@"device"]) {
        //插座
        if (button.selected) {
            button.selected = NO;
            [Request getResult:@"OFF1" ip:model.ipAdress completeWithData:^(BOOL isSuccess) {
            }];
            
            
        }else{
            button.selected = YES;
            //开关开启
            [Request getResult:@"ON1" ip:model.ipAdress completeWithData:^(BOOL isSuccess) {
            }];
            
        }
    }else{
        //灯泡
        if (button.selected) {
            button.selected = NO;
            [Request getResult:@"OFF2" ip:model.ipAdress completeWithData:^(BOOL isSuccess) {
            }];
           
        }else{
            button.selected = YES;
            //开关开启
            [Request getResult:@"ON2" ip:model.ipAdress completeWithData:^(BOOL isSuccess) {
            }];
            
        }

    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [tableView setEditing:YES animated:YES];
}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    //删除名字
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"name"];
//    //隐藏列表
//    _tab.hidden = YES;
//    //显示图片
//    bgImage.hidden = NO;
//    //刷新列表
//    [lightArr removeObjectAtIndex:0];
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    
//}
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
