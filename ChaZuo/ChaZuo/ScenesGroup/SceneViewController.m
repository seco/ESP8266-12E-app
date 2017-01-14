//
//  ScenesViewController.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "SceneViewController.h"
#import "Header.h"

@interface SceneViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,showDelegat>
{
    UICollectionView*collect;
    NSMutableArray*titleAr,*imgArr;
    ShowView*show;
}
@end

@implementation SceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titleAr = [[NSMutableArray alloc]initWithCapacity:0];
    imgArr = [[NSMutableArray alloc]initWithCapacity:0];
    [titleAr addObject:@"Good Morning"];
    [titleAr addObject:@"Good Night"];
    [titleAr addObject:@"Movie Night"];
    [titleAr addObject:@"Custom"];
    [imgArr addObject:@"1"];
    [imgArr addObject:@"2"];
    [imgArr addObject:@"3"];
    [imgArr addObject:@"4"];
    
    
    
    UIImageView *image = [[UIImageView alloc]init];
    image.image = [UIImage imageNamed:@"title"];
    [self.view addSubview:image];
    image.sd_layout
    .leftSpaceToView(self.view,0)
    .rightEqualToView(self.view)
    .heightIs(SCREENHEIGHT/7)
    .topSpaceToView(self.view,0);

     [self.view addSubview:[self creatCollectionView]];
    

}
//添加分区的瀑布流
-(UICollectionView*)creatCollectionView{
    
    if (!collect) {
        //创建一个layout布局类
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        //设置布局方向为垂直流布局
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((SCREENWIDTH-0.6)/2, (SCREENWIDTH-0.6)/2);
        layout. minimumInteritemSpacing = 0.2;
        layout.minimumLineSpacing = 0.2;
        
        collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0.2,SCREENHEIGHT/7, SCREENWIDTH-0.4, (titleAr.count/2+1)*((SCREENWIDTH-0.6)/2)-SCREENHEIGHT/7-SCREENHEIGHT/11) collectionViewLayout:layout];
        collect.scrollEnabled = NO;
        collect.backgroundColor = [UIColor whiteColor];
        
        //代理设置
        collect.delegate=self;
        collect.dataSource=self;
        //注册item类型 这里使用系统的类型
        [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    }
    
    
    return collect;
}


// 每个区有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return titleAr.count;
}
//加载每一个cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell* cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    UIImageView*imagee = [cell viewWithTag:100];
    imagee.image = [UIImage imageNamed:@""];
    UILabel *labb = [cell viewWithTag:200];
    [labb removeFromSuperview];
    
    
    
    //设置cell的样式 标题和图片
    cell.layer.borderColor=[UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1].CGColor;
    cell.layer.borderWidth= 1;
    
    
    //在cell上添加图片
    UIImageView *image = [[UIImageView alloc]init];
    image.tag = 100;
    image.image = [UIImage imageNamed:imgArr[indexPath.item]];
    [cell addSubview:image];
    image.sd_layout
    .leftSpaceToView(cell,cell.frame.size.width/4)
    .widthIs(cell.frame.size.width/2)
    .heightEqualToWidth()
    .topSpaceToView(cell,cell.frame.size.width/4);
    
    
    //在cell上添加文字
    UILabel *lab  = [[UILabel alloc]init];
    lab.tag = 200;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont fontWithName:@"Helvetica" size:15];
    lab.textColor = [UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    lab.text = titleAr[indexPath.item];
    [cell addSubview:lab];
    lab.sd_layout
    .leftSpaceToView(cell,0)
    .rightEqualToView(cell)
    .heightIs(30)
    .topSpaceToView(image,5);
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //点击弹出自定义提示框
    show = [[ShowView alloc]initWithView];
    show.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    show.delegat = self;
    [UIView animateWithDuration:1 animations:^{
        [self.view addSubview:show];
    }];
    
}

-(void)returnIndex:(NSInteger)index{
    if (index == 10) {
        [UIView animateWithDuration:1 animations:^{
           [show removeFromSuperview];
        }];

        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
