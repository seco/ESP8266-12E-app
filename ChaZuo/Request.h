//
//  Request.h
//  ChaZuo
//
//  Created by MingMing on 17/1/16.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface Request : NSObject
//控制开关
+(void)getResult:(NSString*)state ip:(NSString*)ipAdress completeWithData:(void (^)(BOOL isSuccess))complete;

@end
