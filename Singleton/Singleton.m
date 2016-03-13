//
//  Singleton.m
//  OCCommon
//
//  Created by 游峰 on 16/3/1.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

// 
static Singleton *_instance = nil;
+ (instancetype)shareSingleton
{
    // onceToken默认等于0, 只要执行一次之后就不等于0了,
    // 原理是通过判断onceToken是否等于0决定是否需要执行block
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

+ (instancetype)defaultSingleton
{
    if (!_instance) _instance = [[self allocWithZone:NULL] init];
    return _instance;
}

@end
