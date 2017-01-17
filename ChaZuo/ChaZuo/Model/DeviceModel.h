//
//  DeviceModel.h
//  ChaZuo
//
//  Created by MingMing on 17/1/16.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceModel : NSObject<NSCoding>

@property(nonatomic,copy)NSString*deviceName;
@property(nonatomic,copy)NSString*ipAdress;
@property(nonatomic,copy)NSString*imageIcon;
-(id)initWithDevice:(NSString*)deviceName Adress:(NSString*)adress image:(NSString*)aImage;
@end
