//
//  ShowView.h
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol showDelegat <NSObject>

-(void)returnIndex:(NSInteger)index;

@end

@interface ShowView : UIView
@property(nonatomic,strong)UIButton*cancelBtn;
@property(nonatomic,strong)UILabel*titleA;
@property(nonatomic,strong)UILabel*message;
@property(nonatomic,strong)UIButton*btn1;
@property(nonatomic,strong)UIButton*btn2;
@property(nonatomic,strong)UIButton*btn3;
@property(nonatomic,strong)UIButton*installBtn;
@property(nonatomic,strong)UIView*bgview;

-(id)initWithView;
@property(nonatomic,assign)id<showDelegat>delegat;
@end


