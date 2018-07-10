//
//  HHNotification.h
//  NSNotificationCracking
//
//  Created by kingyee on 2018/6/12.
//  Copyright © 2018年 kingyee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHNotification : NSObject

@property (readonly, copy) NSString *name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

-(instancetype)initWithName:(NSString*)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

+(instancetype)notificationWithName:(NSString*)name object:(id)object;

+(instancetype)notificationWithName:(NSString*)name object:(id)object userInfo:(nullable NSDictionary *)aUserInfo;


@end
