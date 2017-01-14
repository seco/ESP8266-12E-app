//
//  MySocket.h
//  SocketTest
//
//  Created by MingMing on 17/1/13.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsyncSocket.h"


@interface MySocket : NSObject<AsyncSocketDelegate>

@property (nonatomic, retain) NSTimer        *connectTimer; // 计时器
@property (nonatomic, strong) AsyncSocket    *socket;       // socket
@property (nonatomic, copy  ) NSString       *socketHost;   // socket的Host
@property (nonatomic, assign) UInt16         socketPort;    // socket的prot
@property (nonatomic, copy)   NSString*pin; //选择频脚
@property (nonatomic, copy)   NSString*state; // 选择状态
// 用户手动断开socket连接
-(void)cutOffSocket;

// socket连接
-(void)socketConnectHost;

//创建一个单例对象 确保一个对象
+ (MySocket *)sharedInstance;

@end
