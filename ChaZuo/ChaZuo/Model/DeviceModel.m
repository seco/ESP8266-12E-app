//
//  DeviceModel.m
//  ChaZuo
//
//  Created by MingMing on 17/1/16.
//  Copyright © 2017年 Luxshare. All rights reserved.
//

#import "DeviceModel.h"

@implementation DeviceModel
-(id)initWithDevice:(NSString*)deviceName Adress:(NSString*)adress image:(NSString*)aImage{
    if (self == [super init]) {
        
        self.deviceName = deviceName;
        self.ipAdress = adress;
        self.imageIcon = aImage;
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
   [aCoder encodeObject:self.deviceName forKey:@"name"];
   [aCoder encodeObject:self.ipAdress forKey:@"ip"];
    [aCoder encodeObject:self.imageIcon forKey:@"imageIcon"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        
     self.deviceName = [aDecoder decodeObjectForKey:@"name"];
     self.ipAdress = [aDecoder decodeObjectForKey:@"ip"];
     self.imageIcon = [aDecoder decodeObjectForKey:@"imageIcon"];
    }
    return self;
}
@end
