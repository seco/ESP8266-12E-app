//
//  ShowView.m
//  ChaZuo
//
//  Created by MingMing on 17/1/12.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "ShowView.h"
#import "Header.h"
@implementation ShowView
-(id)initWithView{
    if (self == [super init]) {
        
       self.backgroundColor = [UIColor colorWithRed:179.0/255.0 green:179.0/255.0 blue:179.0/255.0 alpha:0.3];
        [self creatView];
    }
    return self;
}


-(void)creatView{
  
        _bgview = [[UIView alloc]init];
        _bgview.layer.cornerRadius = 5;
        _bgview.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bgview];
        _bgview.sd_layout
        .leftSpaceToView(self,5)
        .rightSpaceToView(self,5)
        .topSpaceToView(self,SCREENHEIGHT/6)
        .heightIs(SCREENHEIGHT/2);
        
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        _cancelBtn.tag = 10;
        [_cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:_cancelBtn];
        _cancelBtn.sd_layout
        .leftSpaceToView(_bgview,10)
        .topSpaceToView(_bgview,10)
        .heightIs(35)
        .widthIs(40);
        
        
        
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"showTitle"];
        [_bgview addSubview:image];
        image.sd_layout
        .leftSpaceToView(_bgview,0)
        .rightEqualToView(_bgview)
        .heightIs(_bgview.bounds.size.height/3.5)
        .topSpaceToView(_cancelBtn,0);
        
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"pic1"] forState:UIControlStateNormal];
        _btn1.tag = 11;
        [_btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:_btn1];
        _btn1.sd_layout
        .leftSpaceToView(_bgview,SCREENWIDTH/8)
        .topSpaceToView(image,20)
        .heightIs(SCREENHEIGHT/11)
        .widthIs(SCREENWIDTH/8);
        
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"pic2"] forState:UIControlStateNormal];
        _btn2.tag = 12;
        [_btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:_btn2];
        _btn2.sd_layout
        .leftSpaceToView(_btn1,SCREENWIDTH/5.5)
        .topSpaceToView(image,20)
        .heightIs(SCREENHEIGHT/11)
        .widthIs(SCREENWIDTH/8);
        
        
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn3 setBackgroundImage:[UIImage imageNamed:@"pic3"] forState:UIControlStateNormal];
        _btn3.tag = 13;
        [_btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:_btn3];
        _btn3.sd_layout
        .rightSpaceToView(_bgview,SCREENWIDTH/8)
        .topSpaceToView(image,20)
        .heightIs(SCREENHEIGHT/11)
        .widthIs(SCREENWIDTH/8);
        
        
        _installBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_installBtn setBackgroundImage:[UIImage imageNamed:@"install device"] forState:UIControlStateNormal];
        [_bgview addSubview:_installBtn];
        _installBtn.sd_layout
        .leftSpaceToView(_bgview,SCREENWIDTH/8)
        .rightSpaceToView(_bgview,SCREENWIDTH/8)
        .heightIs(SCREENHEIGHT/11)
        .bottomSpaceToView(_bgview,SCREENHEIGHT/22);
   
    }

-(void)btnClick:(UIButton*)btn{
    switch (btn.tag) {
        case 10:
            [_delegat returnIndex:10];
            
            break;
        case 11:
            
            break;
        case 12:
            
            break;
        case 13:
            
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
