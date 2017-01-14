//
//  MySocket.m
//  SocketTest
//
//  Created by MingMing on 17/1/13.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "MySocket.h"

@implementation MySocket

//创建单例对象
+(MySocket *) sharedInstance
{
    static MySocket *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[self alloc] init];
    });
    
    return sharedInstace;
}

#pragma mark  - 连接成功回调
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString*)host port:(UInt16)port
{
    NSLog(@"socket连接成功");
    // 每隔30s像服务器发送心跳包
    self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(longConnectToSocket) userInfo:nil repeats:YES];// 在longConnectToSocket方法中进行长连接需要向服务器发送的讯息
    [self.connectTimer fire];
    
}
//用一个枚举类型来规定简介不成功的原因（服务器掉线/用户手动断开）
enum{
    SocketOfflineByServer,// 服务器掉线，默认为0
    SocketOfflineByUser,  // 用户主动cut
};
// 切断socket
-(void)cutOffSocket{
    self.socket.userData = SocketOfflineByUser;// 声明是由用户主动切断
    [self.connectTimer invalidate];
    [self.socket disconnect];
}
//进行长连接
-(void)longConnectToSocket{
    //给服务器发送数据
    //{"gpio": {"pin": 2, "state": 0}}
    NSMutableDictionary*dic = [[NSMutableDictionary alloc]init];
   
    NSDictionary*d = [[NSDictionary alloc]initWithObjectsAndKeys:_pin,@"pin",_state,@"state", nil];
    [dic setObject:d forKey:@"gpio"];
    NSLog(@"----%@",dic);
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    

    
    
    
    
    
//    NSData *dataStream  = [@"test" dataUsingEncoding:NSUTF8StringEncoding];
    [self.socket writeData:jsonData withTimeout:1 tag:1];
    [self.socket readDataWithTimeout:1 tag:0];
}
//读取返回的数据
- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSLog(@"------%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}
//socket连接
-(void)socketConnectHost{
    
    self.socket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError *error = nil;
    BOOL isSuccess =  [self.socket connectToHost:self.socketHost onPort:self.socketPort withTimeout:1 error:&error];
    if (isSuccess) {
        NSLog(@"---连接成功------");
    }else{
        NSLog(@"-----连接失败----");
    }
}


@end
