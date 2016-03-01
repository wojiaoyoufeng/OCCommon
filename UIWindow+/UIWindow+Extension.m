//
//  UIWindow+Extension.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/1.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)

static UIWindow *window_;
+ (UIWindow *)show{
    
    window_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window_.hidden = NO;
    
    return window_;
}

+ (UIWindow *)showInRect:(CGRect)rect{
    
    window_ = [[UIWindow alloc] initWithFrame:rect];
    window_.hidden = NO;
    
    return window_;
}

+ (UIWindow *)showWithLevel:(UIWindowLevel)level{
    
    window_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window_.windowLevel = level;
    window_.hidden = NO;
    
    return window_;
}

+ (UIWindow *)showWithLevel:(UIWindowLevel)level Rect:(CGRect)rect{
    
    window_ = [[UIWindow alloc] initWithFrame:rect];
    window_.windowLevel = level;
    window_.hidden = NO;
    
    return window_;
}

+ (void)dismiss{
    
    window_ = nil;
}

@end
