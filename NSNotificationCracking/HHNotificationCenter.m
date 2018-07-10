//
//  HHNotificationCenter.m
//  NSNotificationCracking
//
//  Created by kingyee on 2018/6/12.
//  Copyright © 2018年 kingyee. All rights reserved.
//

#import "HHNotificationCenter.h"

typedef void(^OperationBlock)(HHNotification *notification);

@interface HHObserverModel:NSObject

@property (nonatomic, strong) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, copy)   NSString *notificationName;
@property (nonatomic, strong) id object;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, copy)   OperationBlock block;

@end

@implementation HHObserverModel


@end

@interface HHNotificationCenter()

@property (nonatomic, strong) NSMutableSet *observers;

@end;

@implementation HHNotificationCenter


+(HHNotificationCenter*)defaultCenter
{
    static HHNotificationCenter *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton=[[self alloc]initSingleton];
        
    });
    return singleton;
}
- (instancetype)initSingleton
{
    if ([super init]) {
        _observers = [NSMutableSet set];
    }
    return self;
}
-(void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object
{
    HHObserverModel *model=[[HHObserverModel alloc]init];
    model.observer=observer;
    model.selector=selector;
    model.object=object;
    model.notificationName=name;
    [_observers addObject:model];
    
}
-(void)postNotificationName:(NSString*)aName object:(id)anObject
{
    [self postNotificationName:aName object:anObject userInfo:nil ];
}
-(void)postNotificationName:(NSString*)aName object:(id)anObject userInfo:(NSDictionary*)aUserInfo
{
    HHNotification *notification=[[HHNotification alloc]initWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotifation:notification];
    
}
-(void)postNotifation:(HHNotification *)notifation
{
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        HHObserverModel *model=obj;
        id observer=model.observer;
        SEL selector=model.selector;
        if (!model.operationQueue) {
            [observer performSelector:selector withObject:notifation];
        }
        
    }];
    
}
-(void)removeObserver:(id )observer
{
    [self removeObserver:observer name:nil object:nil];
    
}
-(void)removeObserver:(id )observer name:(NSString*)aName object:(nullable id)anObject
{
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        HHObserverModel *observerModel = obj;
        if (observerModel.observer == observer && [observerModel.notificationName isEqualToString:aName] && observerModel.object == anObject) {
            [self.observers removeObject:observerModel];
            *stop = YES;
        }
    }];
}


@end
