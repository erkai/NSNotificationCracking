//
//  HHNotification.m
//  NSNotificationCracking
//
//  Created by kingyee on 2018/6/12.
//  Copyright © 2018年 kingyee. All rights reserved.
//

#import "HHNotification.h"

@implementation HHNotification

-(instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    if (self==[super init]) {
        _name=name;
        _object=object;
        _userInfo=userInfo;
    }
    return self;
}

+(instancetype)notificationWithName:(NSString *)name object:(id)object
{
    return [[self alloc]initWithName:name object:object userInfo:nil];
}
+(instancetype)notificationWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)aUserInfo
{
    return [[self alloc]initWithName:name object:object userInfo:aUserInfo];
}


@end
