//
//  Request.m
//  ChaZuo
//
//  Created by MingMing on 17/1/16.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "Request.h"
#define kManager AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];manager.responseSerializer = [AFHTTPResponseSerializer serializer];
@implementation Request
+(void)getResult:(NSString*)state ip:(NSString*)ipAdress completeWithData:(void (^)(BOOL isSuccess))complete{
    kManager;
    NSLog(@"---%@",[NSString stringWithFormat:@"http://%@/?pin=%@",ipAdress,state] );
    [manager GET:[NSString stringWithFormat:@"http://%@/?pin=%@",ipAdress,state] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"----%@",dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        
    }];
//    kManager;
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
//    [dic setObject:state forKey:@"pin"];
//    
//    [manager POST:@"http://192.168.0.100/"parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//       
//    }];

}
@end
