//
//  HHNotificationCenter.h
//  NSNotificationCracking
//
//  Created by kingyee on 2018/6/12.
//  Copyright © 2018年 kingyee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHNotification.h"


@interface HHNotificationCenter : NSObject

+(HHNotificationCenter*)defaultCenter;

-(void)addObserver:(id)observer selector:(SEL)selector name:(NSString*)name
            object:(id)object;

- (void)postNotification:(HHNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSString *_Nullable)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id _Nullable )observer;
- (void)removeObserver:(id _Nonnull )observer name:(nullable NSString *)aName object:(nullable id)anObject;



@end
